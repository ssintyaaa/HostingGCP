-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absensi_smk_alhafidz`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwals`
--

CREATE TABLE `jadwals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kelas_id` bigint(20) UNSIGNED NOT NULL,
  `mapel_id` bigint(20) UNSIGNED NOT NULL,
  `guru_id` bigint(20) UNSIGNED NOT NULL,
  `hari` enum('senin','selasa','rabu','kamis','jumat','sabtu') NOT NULL,
  `jam_ke` tinyint(3) UNSIGNED NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `berlaku_dari` date DEFAULT NULL,
  `berlaku_sampai` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `semester_akademik_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jadwals`
--

INSERT INTO `jadwals` (`id`, `kelas_id`, `mapel_id`, `guru_id`, `hari`, `jam_ke`, `aktif`, `berlaku_dari`, `berlaku_sampai`, `created_at`, `updated_at`, `semester_akademik_id`) VALUES
(26, 22, 30, 2, 'senin', 1, 1, '2026-01-01', '2026-06-30', '2026-05-09 07:39:56', '2026-05-09 07:39:56', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusans`
--

CREATE TABLE `jurusans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `singkatan` varchar(50) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jurusans`
--

INSERT INTO `jurusans` (`id`, `nama`, `singkatan`, `aktif`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pengembangan Perangkat Lunak dan Gim', 'PPLG', 1, '2026-04-19 03:18:00', '2026-04-19 03:18:00', NULL),
(2, 'Manajemen Perkantoran dan Layanan Bisnis', 'MPLB', 1, '2026-04-19 03:18:00', '2026-04-19 03:18:00', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kalender_akademiks`
--

CREATE TABLE `kalender_akademiks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'lainnya',
  `is_holiday` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kalender_akademiks`
--

INSERT INTO `kalender_akademiks` (`id`, `name`, `starts_at`, `ends_at`, `type`, `is_holiday`, `is_active`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'Hari Buruh Internasional', '2026-05-25', '2026-05-25', 'libur_nasional', 1, 1, NULL, '2026-05-12 08:18:05', '2026-05-14 07:55:46'),
(2, 'malas', '2026-05-18', '2026-05-18', 'lainnya', 1, 1, NULL, '2026-05-14 06:55:21', '2026-05-14 07:07:48'),
(3, 'malassss', '2026-05-11', '2026-05-11', 'lainnya', 0, 1, NULL, '2026-05-14 07:24:24', '2026-05-14 07:24:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `tingkat_angka` int(11) DEFAULT NULL,
  `jurusan` varchar(50) NOT NULL,
  `nomor` tinyint(3) UNSIGNED NOT NULL,
  `nama` varchar(80) NOT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `next_kelas_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `tingkat`, `tingkat_angka`, `jurusan`, `nomor`, `nama`, `aktif`, `created_at`, `updated_at`, `deleted_at`, `next_kelas_id`) VALUES
(3, 'X', 10, 'PPLG', 1, 'X PPLG 1', 1, '2026-02-26 01:53:19', '2026-05-06 16:18:07', NULL, 9),
(4, 'X', 10, 'PPLG', 2, 'X PPLG 2', 1, '2026-02-28 00:55:59', '2026-05-06 16:18:07', NULL, 10),
(9, 'XI', 11, 'PPLG', 1, 'XI PPLG 1', 1, '2026-02-28 00:57:29', '2026-05-06 16:18:07', NULL, 15),
(10, 'XI', 11, 'PPLG', 2, 'XI PPLG 2', 1, '2026-02-28 00:57:45', '2026-05-06 16:18:07', NULL, 16),
(12, 'XI', 11, 'MPLB', 1, 'XI MPLB 1', 1, '2026-02-28 00:58:22', '2026-05-06 16:18:07', NULL, 18),
(13, 'XI', 11, 'MPLB', 2, 'XI MPLB 2', 1, '2026-02-28 00:58:39', '2026-05-06 16:18:07', NULL, 19),
(14, 'XI', 11, 'MPLB', 3, 'XI MPLB 3', 1, '2026-02-28 00:58:55', '2026-05-06 16:18:07', NULL, 20),
(15, 'XII', 12, 'PPLG', 1, 'XII PPLG 1', 1, '2026-02-28 00:59:14', '2026-02-28 00:59:14', NULL, NULL),
(16, 'XII', 12, 'PPLG', 2, 'XII PPLG 2', 1, '2026-02-28 00:59:36', '2026-02-28 00:59:36', NULL, NULL),
(17, 'XII', 12, 'PPLG', 3, 'XII PPLG 3', 1, '2026-02-28 01:01:09', '2026-02-28 01:01:09', NULL, NULL),
(18, 'XII', 12, 'MPLB', 1, 'XII MPLB 1', 1, '2026-02-28 01:01:25', '2026-02-28 01:01:25', NULL, NULL),
(19, 'XII', 12, 'MPLB', 2, 'XII MPLB 2', 1, '2026-02-28 01:01:41', '2026-02-28 01:01:41', NULL, NULL),
(20, 'XII', 12, 'MPLB', 3, 'XII MPLB 3', 1, '2026-02-28 01:01:59', '2026-02-28 01:01:59', NULL, NULL),
(22, 'X', 10, 'MPLB', 1, 'X MPLB 1', 1, '2026-03-05 02:51:04', '2026-05-06 16:18:07', NULL, 12),
(23, 'X', 10, 'MPLB', 2, 'X MPLB 2', 1, '2026-03-05 02:51:24', '2026-05-06 16:18:07', NULL, 13),
(24, 'X', 10, 'MPLB', 3, 'X MPLB 3', 1, '2026-03-05 02:57:23', '2026-05-06 16:18:07', NULL, 14),
(26, 'XI', 11, 'MPLB', 4, 'XI MPLB 4', 1, '2026-03-09 15:37:51', '2026-03-09 15:37:51', NULL, NULL),
(28, 'X', 10, 'PPLG', 3, 'X PPLG 3', 1, '2026-04-02 04:58:19', '2026-04-02 04:58:19', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapels`
--

CREATE TABLE `mapels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `aktif` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `mapels`
--

INSERT INTO `mapels` (`id`, `nama`, `kode`, `aktif`, `created_at`, `updated_at`) VALUES
(16, 'Bahasa Indonesia', 'B.INDO', 1, '2026-03-05 01:42:05', '2026-03-05 01:45:10'),
(20, 'Bimbingan Konseling', 'BK', 1, '2026-03-05 01:46:07', '2026-03-05 01:46:07'),
(21, 'BTQ', 'BTQ', 1, '2026-03-05 01:46:26', '2026-03-05 01:46:26'),
(26, 'Jaringan Komputer', 'JARKOM', 1, '2026-03-05 01:48:33', '2026-03-05 01:48:33'),
(29, 'KTK', 'KTK', 1, '2026-03-05 01:49:53', '2026-03-05 01:49:53'),
(30, 'Matematika', 'MTK', 1, '2026-03-05 01:50:12', '2026-03-05 01:50:12'),
(31, 'Praktikum Web', 'P WEB', 1, '2026-03-05 01:50:50', '2026-03-05 01:50:50'),
(32, 'Pendidikan Agama Islam', 'PAI', 1, '2026-03-05 01:51:15', '2026-03-05 01:51:15'),
(35, 'Pendidikan Kewarganegaraan', 'PKN', 1, '2026-03-05 01:52:17', '2026-03-05 01:52:17'),
(36, 'Pendidikan Jasmani, Olahraga, dan Kesehatan', 'PJOK', 1, '2026-03-05 01:52:49', '2026-03-05 01:52:49'),
(37, 'PKK', 'PKK', 1, '2026-03-05 01:53:23', '2026-03-05 01:53:23'),
(38, 'PPL', 'PPL', 1, '2026-03-05 01:53:37', '2026-03-05 01:53:37'),
(39, 'PRP', 'PRP', 1, '2026-03-05 01:53:54', '2026-03-05 01:53:54'),
(40, 'PROTER', 'PROTER', 1, '2026-03-05 01:54:11', '2026-03-05 01:54:11'),
(41, 'Seni Budaya dan Keterampilan', 'SBK', 1, '2026-03-05 01:54:36', '2026-03-05 01:54:36'),
(42, 'Sejarah', 'SEJARAH', 1, '2026-03-05 01:54:55', '2026-03-05 01:54:55'),
(43, 'Sistem Komunikasi', 'SISKOM', 1, '2026-03-05 01:55:14', '2026-03-05 01:55:14'),
(44, 'TP', 'TP', 1, '2026-03-05 01:55:32', '2026-03-05 01:55:32'),
(45, 'WDK- MP', 'WDK-MP', 1, '2026-03-05 01:56:39', '2026-03-05 01:56:39'),
(46, 'WDK- MLB', 'WDK-MLB', 1, '2026-03-05 01:57:09', '2026-03-05 01:57:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_02_24_082312_add_role_username_nis_to_users_table', 2),
(5, '2026_02_26_064804_create_kelas_table', 3),
(6, '2026_02_27_080141_add_wali_kelas_id_to_users_table', 4),
(7, '2026_02_28_072711_make_email_nullable_in_users_table', 5),
(8, '2026_02_28_073943_add_kelas_id_to_users_table', 6),
(9, '2026_02_28_132044_create_mapels_table', 7),
(10, '2026_02_28_225054_create_jadwals_table', 8),
(11, '2026_02_28_232254_create_presensi_sesis_table', 9),
(12, '2026_02_28_232311_create_presensi_details_table', 9),
(13, '2026_03_06_071807_add_masa_berlaku_to_jadwals_table', 10),
(14, '2026_04_19_100339_create_jurusans_table', 11),
(15, '2026_04_24_071235_add_is_active_to_users_table', 12),
(16, '2026_04_24_080246_add_keterangan_nonaktif_to_users_table', 13),
(17, '2026_05_06_222805_buat_tabel_tahun_ajaran', 14),
(18, '2026_05_06_222836_buat_tabel_semester_akademik', 14),
(19, '2026_05_06_222915_buat_tabel_riwayat_kelas_siswa', 14),
(20, '2026_05_06_222938_tambah_semester_ke_jadwal_pelajaran', 14),
(21, '2026_05_06_223001_tambah_tingkat_dan_kelas_tujuan_ke_kelas', 14),
(22, '2026_05_06_223022_isi_default_tahun_ajaran_semester_dan_backfill_jadwal', 14),
(23, '2026_05_07_001244_buat_tabel_kalender_akademik', 15),
(24, '2026_05_07_014007_rapikan_nama_tabel_dan_kolom_akademik_ke_indonesia', 16);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_details`
--

CREATE TABLE `presensi_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `presensi_sesi_id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('hadir','izin','sakit','alfa') NOT NULL DEFAULT 'alfa',
  `keterangan` text DEFAULT NULL,
  `metode` enum('siswa','guru') NOT NULL DEFAULT 'siswa',
  `waktu_isi` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `presensi_details`
--

INSERT INTO `presensi_details` (`id`, `presensi_sesi_id`, `siswa_id`, `status`, `keterangan`, `metode`, `waktu_isi`, `created_at`, `updated_at`) VALUES
(275, 211, 25, 'alfa', NULL, 'guru', NULL, '2026-05-09 07:42:01', '2026-05-09 07:42:01'),
(276, 211, 30, 'alfa', NULL, 'guru', NULL, '2026-05-09 07:42:01', '2026-05-09 07:42:01'),
(277, 230, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 06:58:25', '2026-05-14 06:58:25'),
(278, 230, 30, 'alfa', NULL, 'guru', NULL, '2026-05-14 06:58:25', '2026-05-14 06:58:25'),
(279, 230, 35, 'alfa', NULL, 'guru', NULL, '2026-05-14 06:58:25', '2026-05-14 06:58:25'),
(280, 212, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:29', '2026-05-14 07:13:29'),
(281, 213, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:29', '2026-05-14 07:13:29'),
(282, 214, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:29', '2026-05-14 07:13:29'),
(283, 215, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:29', '2026-05-14 07:13:29'),
(284, 216, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:29', '2026-05-14 07:13:29'),
(285, 217, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(286, 218, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(287, 219, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(288, 220, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(289, 221, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(290, 222, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(291, 223, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(292, 224, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(293, 225, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(294, 226, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:30', '2026-05-14 07:13:30'),
(295, 227, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(296, 228, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(297, 229, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(298, 231, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(299, 232, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(300, 233, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(301, 234, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(302, 235, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31'),
(303, 236, 25, 'alfa', NULL, 'guru', NULL, '2026-05-14 07:13:31', '2026-05-14 07:13:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `presensi_sesis`
--

CREATE TABLE `presensi_sesis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jadwal_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('draft','open','closed') NOT NULL DEFAULT 'draft',
  `dibuka_pada` datetime DEFAULT NULL,
  `dibuka_oleh` bigint(20) UNSIGNED DEFAULT NULL,
  `ditutup_pada` datetime DEFAULT NULL,
  `ditutup_oleh` bigint(20) UNSIGNED DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `presensi_sesis`
--

INSERT INTO `presensi_sesis` (`id`, `jadwal_id`, `tanggal`, `status`, `dibuka_pada`, `dibuka_oleh`, `ditutup_pada`, `ditutup_oleh`, `catatan`, `created_at`, `updated_at`) VALUES
(211, 26, '2026-01-05', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(212, 26, '2026-01-12', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(213, 26, '2026-01-19', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(214, 26, '2026-01-26', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(215, 26, '2026-02-02', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(216, 26, '2026-02-09', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(217, 26, '2026-02-16', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(218, 26, '2026-02-23', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(219, 26, '2026-03-02', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(220, 26, '2026-03-09', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(221, 26, '2026-03-16', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(222, 26, '2026-03-23', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(223, 26, '2026-03-30', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(224, 26, '2026-04-06', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(225, 26, '2026-04-13', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(226, 26, '2026-04-20', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(227, 26, '2026-04-27', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(228, 26, '2026-05-04', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(229, 26, '2026-05-11', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:45', '2026-05-09 07:41:45'),
(230, 26, '2026-05-18', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(231, 26, '2026-05-25', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(232, 26, '2026-06-01', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(233, 26, '2026-06-08', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(234, 26, '2026-06-15', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(235, 26, '2026-06-22', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46'),
(236, 26, '2026-06-29', 'draft', NULL, NULL, NULL, NULL, NULL, '2026-05-09 07:41:46', '2026-05-09 07:41:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_kelas_siswas`
--

CREATE TABLE `riwayat_kelas_siswas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_id` bigint(20) UNSIGNED NOT NULL,
  `from_kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `to_kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tahun_ajaran_id` bigint(20) UNSIGNED NOT NULL,
  `action_type` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL,
  `processed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `riwayat_kelas_siswas`
--

INSERT INTO `riwayat_kelas_siswas` (`id`, `siswa_id`, `from_kelas_id`, `to_kelas_id`, `tahun_ajaran_id`, `action_type`, `notes`, `processed_by`, `processed_at`, `created_at`, `updated_at`) VALUES
(19, 6, 4, 10, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(20, 7, 23, 13, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(21, 25, 22, 12, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(22, 27, 23, 13, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(23, 30, 22, 12, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(24, 31, 23, 13, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(25, 35, 22, 12, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(26, 36, 23, 13, 1, 'naik_kelas', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26'),
(27, 37, 18, NULL, 1, 'lulus', NULL, 1, '2026-05-16 12:36:26', '2026-05-16 12:36:26', '2026-05-16 12:36:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester_akademiks`
--

CREATE TABLE `semester_akademiks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tahun_ajaran_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `semester_akademiks`
--

INSERT INTO `semester_akademiks` (`id`, `tahun_ajaran_id`, `name`, `starts_at`, `ends_at`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Semester Genap', '2026-01-01', '2026-06-30', 1, '2026-05-06 16:03:10', '2026-05-06 18:53:25'),
(2, 1, 'Semester Ganjil', '2025-07-01', '2025-12-31', 0, '2026-05-06 18:56:23', '2026-05-06 18:56:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('7SRDEismdNGzxuzMW0i4rKWeJnmGUeIg2Y4EBClj', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoibUpZSlJKZlNRUmd3UGpyY3lLWmdheFFhMUowUXQybmJLVXFBVXpWaSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbiI7czo1OiJyb3V0ZSI7czozMDoiZmlsYW1lbnQuYWRtaW4ucGFnZXMuZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiNTUyNTE4Y2IzZTcxYTNlZmVkODBhMGQ1ZDU3NGU3NjMzMzA5YWU0YmM3NjU0OTc0N2Q0YTViNjBjOWQ1YTNlNSI7czo2OiJ0YWJsZXMiO2E6MTE6e3M6NDA6IjMwNjI3Y2NhYmMzNDEwOGMyMDFkYTAzZWM4MjYzMjY3X2NvbHVtbnMiO2E6Nzp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6InJvd19pbmRleCI7czo1OiJsYWJlbCI7czoyOiJObyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoidGluZ2thdCI7czo1OiJsYWJlbCI7czo3OiJUaW5na2F0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJqdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6Im5vbW9yIjtzOjU6ImxhYmVsIjtzOjU6Ik5vbW9yIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1hIjtzOjU6ImxhYmVsIjtzOjQ6Ik5hbWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJuZXh0S2VsYXMubmFtYSI7czo1OiJsYWJlbCI7czo3OiJOYWlrIEtlIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJha3RpZiI7czo1OiJsYWJlbCI7czo2OiJTdGF0dXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjJiMjVmYjhhNGRiMmNjOWQ1NzIzYjViYWQ5ZjBmMGM1X2NvbHVtbnMiO2E6NTp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjI6Im5vIjtzOjU6ImxhYmVsIjtzOjI6Ik5vIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjEwOiJOYW1hIFNpc3dhIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czozOiJuaXMiO3M6NToibGFiZWwiO3M6MzoiTklTIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJpc19hY3RpdmUiO3M6NToibGFiZWwiO3M6NToiQWt0aWYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE5OiJrZXRlcmFuZ2FuX25vbmFrdGlmIjtzOjU6ImxhYmVsIjtzOjEwOiJLZXRlcmFuZ2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIxOTU0NThhYzVjYzg0Y2IzYmQwOTRjMDZjZTNkM2JlNl9jb2x1bW5zIjthOjc6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJyb3dfaW5kZXgiO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6MTA6Ik5hbWEgU2lzd2EiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjM6Im5pcyI7czo1OiJsYWJlbCI7czozOiJOSVMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJrZWxhcy5uYW1hIjtzOjU6ImxhYmVsIjtzOjU6IktlbGFzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJpc19hY3RpdmUiO3M6NToibGFiZWwiO3M6NjoiU3RhdHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxOToia2V0ZXJhbmdhbl9ub25ha3RpZiI7czo1OiJsYWJlbCI7czoxMDoiS2V0ZXJhbmdhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MzE6Imxhc3RSaXdheWF0S2VsYXMuZnJvbUtlbGFzLm5hbWEiO3M6NToibGFiZWwiO3M6MTQ6IktlbGFzIFRlcmFraGlyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIxOWM2Yjc0MzUzYmQwMzJlZTNiODlmYTUwYTEzYjMwM19jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJyb3dfaW5kZXgiO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWUiO3M6NToibGFiZWwiO3M6OToiTmFtYSBHdXJ1IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJlbWFpbCI7czo1OiJsYWJlbCI7czo1OiJFbWFpbCI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6IndhbGlLZWxhcy5uYW1hIjtzOjU6ImxhYmVsIjtzOjEwOiJXYWxpIEtlbGFzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiI4OTQwZjE0NDRiYzQ4ZjY1YjM1NzIzOTZhZmZiOTk2Nl9jb2x1bW5zIjthOjQ6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjQ6Ik5hbWEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6InN0YXJ0c19hdCI7czo1OiJsYWJlbCI7czo1OiJNdWxhaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoiZW5kc19hdCI7czo1OiJsYWJlbCI7czo3OiJTZWxlc2FpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJpc19hY3RpdmUiO3M6NToibGFiZWwiO3M6NjoiU3RhdHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIzMDU5Nzc4ZDc1NzczOGNiMmRlMzhmN2UwNzc2ZGFiMl9jb2x1bW5zIjthOjU6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoidGFodW5BamFyYW4ubmFtZSI7czo1OiJsYWJlbCI7czoxMjoiVGFodW4gQWphcmFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJuYW1lIjtzOjU6ImxhYmVsIjtzOjg6IlNlbWVzdGVyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJzdGFydHNfYXQiO3M6NToibGFiZWwiO3M6NToiTXVsYWkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6ImVuZHNfYXQiO3M6NToibGFiZWwiO3M6NzoiU2VsZXNhaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToiaXNfYWN0aXZlIjtzOjU6ImxhYmVsIjtzOjY6IlN0YXR1cyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMTlhMDdlYzUxNzEzNTkxYjFiOGY4MjkyNWQwMzA3NTBfY29sdW1ucyI7YTo0OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czoyMToiTmFtYSBLZWdpYXRhbiAvIExpYnVyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJzdGFydHNfYXQiO3M6NToibGFiZWwiO3M6MTM6IlRhbmdnYWwgTXVsYWkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6ImVuZHNfYXQiO3M6NToibGFiZWwiO3M6MTU6IlRhbmdnYWwgU2VsZXNhaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoidHlwZSI7czo1OiJsYWJlbCI7czo1OiJKZW5pcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiMGFjMDA3NjljN2ExM2FhNzkzZmEwYjgyY2M5OTZkYmVfY29sdW1ucyI7YTo2OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToicm93X2luZGV4IjtzOjU6ImxhYmVsIjtzOjI6Ik5vIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJ0aW5na2F0IjtzOjU6ImxhYmVsIjtzOjc6IlRpbmdrYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjc6Imp1cnVzYW4iO3M6NToibGFiZWwiO3M6NzoiSnVydXNhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToibm9tb3IiO3M6NToibGFiZWwiO3M6NToiTm9tb3IiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6Im5hbWEiO3M6NToibGFiZWwiO3M6NDoiTmFtYSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NToiYWt0aWYiO3M6NToibGFiZWwiO3M6NjoiU3RhdHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiI5ZDM4YjZlMmNiNDFmMWJhOTQ5YmJjMDk2YjZmOTNiZV9jb2x1bW5zIjthOjI6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoyOiJpZCI7czo1OiJsYWJlbCI7czoyOiJObyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoiaGFyaSI7czo1OiJsYWJlbCI7czo0OiJIYXJpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX1zOjQwOiIyY2IxMWIyNDEwNDFjYmVkY2IzNDgyNTg0OGQwMzNiNV9jb2x1bW5zIjthOjc6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoyOiJubyI7czo1OiJsYWJlbCI7czoyOiJObyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NjoiamFtX2tlIjtzOjU6ImxhYmVsIjtzOjY6IkphbSBLZSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6Im1hcGVsLm5hbWEiO3M6NToibGFiZWwiO3M6MTQ6Ik1hdGEgUGVsYWphcmFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo5OiJndXJ1Lm5hbWUiO3M6NToibGFiZWwiO3M6NDoiR3VydSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTI6ImJlcmxha3VfZGFyaSI7czo1OiJsYWJlbCI7czoxMjoiQmVybGFrdSBEYXJpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoiYmVybGFrdV9zYW1wYWkiO3M6NToibGFiZWwiO3M6MTQ6IkJlcmxha3UgU2FtcGFpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo1OiJha3RpZiI7czo1OiJsYWJlbCI7czo1OiJBa3RpZiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiZTdkODY4ODdiOTBmY2RmZTBiMjY3Y2QwNTExOGRkNjNfY29sdW1ucyI7YTo3OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czoxMjoiVGFodW4gQWphcmFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJwZXJpb2RlIjtzOjU6ImxhYmVsIjtzOjc6IlBlcmlvZGUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjk6ImlzX2FjdGl2ZSI7czo1OiJsYWJlbCI7czoxOToiU3RhdHVzIFRhaHVuIEFqYXJhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTU6InN0YXR1c19rZW5haWthbiI7czo1OiJsYWJlbCI7czoxNToiU3RhdHVzIEtlbmFpa2FuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToidG90YWxfc2lzd2EiO3M6NToibGFiZWwiO3M6MTc6IlRvdGFsIFNpc3dhIEFrdGlmIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidG90YWxfbmFpayI7czo1OiJsYWJlbCI7czoxMDoiTmFpayBLZWxhcyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjY7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InRvdGFsX2x1bHVzIjtzOjU6ImxhYmVsIjtzOjU6Ikx1bHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX19czo4OiJmaWxhbWVudCI7YTowOnt9fQ==', 1778936957),
('c5btubqpR0bl9mIqF2tdZtdfC8XY35fecOH00OCO', 25, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiTTlpdXM4YTZhMTlWV3dUc0xScTVobTdUcE9Wd29mSjMzd2M1U2pBZiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zaXN3YS9wcmVzZW5zaS1kZXRhaWxzL2hhcmkvc2VuaW4iO3M6NToicm91dGUiO3M6NDY6ImZpbGFtZW50LnNpc3dhLnJlc291cmNlcy5wcmVzZW5zaS1kZXRhaWxzLmhhcmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyNTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2NDoiYTg0OTZlMjU1ZThiMDUyNDJiYTk0NjNkOWQyMGE1M2QyZjhhMWI4MTFjMzk3ZjI3MmNhMGIyZTFmMzgyYjBjOSI7czo2OiJ0YWJsZXMiO2E6Mjp7czo0MDoiYTQzYWJlYmNmOGJkYTRlMmZlYjZmYTMxYzUwNjhlMzdfY29sdW1ucyI7YTozOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjoiaWQiO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6ImhhcmkiO3M6NToibGFiZWwiO3M6NDoiSGFyaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6Imp1bWxhaF9qYWR3YWwiO3M6NToibGFiZWwiO3M6MTM6Ikp1bWxhaCBKYWR3YWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6Ijg3MGM5ODA5N2Y4NzE4NjM3MTc4YTcxYzYxNzA5ODdmX2NvbHVtbnMiO2E6ODp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6Im5vbW9yIjtzOjU6ImxhYmVsIjtzOjI6Ik5vIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo3OiJ0YW5nZ2FsIjtzOjU6ImxhYmVsIjtzOjc6IlRhbmdnYWwiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJqYWR3YWwuamFtX2tlIjtzOjU6ImxhYmVsIjtzOjM6IkphbSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTc6ImphZHdhbC5tYXBlbC5uYW1hIjtzOjU6ImxhYmVsIjtzOjU6Ik1hcGVsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNjoiamFkd2FsLmd1cnUubmFtZSI7czo1OiJsYWJlbCI7czo0OiJHdXJ1IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo2OiJzdGF0dXMiO3M6NToibGFiZWwiO3M6MTE6IlN0YXR1cyBTZXNpIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMzoicHJlc2Vuc2lfa2FtdSI7czo1OiJsYWJlbCI7czoxMzoiUHJlc2Vuc2kgS2FtdSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjc7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImRpaXNpX3BhZGEiO3M6NToibGFiZWwiO3M6MTA6IkRpaXNpIFBhZGEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fX19', 1778934894),
('JgGFW0FU7QeMlf5HdSqCKJhKyFIgv9Ys8wXNRzn2', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoicVFXQUhNV0pMcmtJQ2VTVk5vaUZpWGRGaEUwaDFienMybGd5S25yTSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9ndXJ1L3ByZXNlbnNpLXNlc2lzL2phZHdhbC8yNiI7czo1OiJyb3V0ZSI7czo0MzoiZmlsYW1lbnQuZ3VydS5yZXNvdXJjZXMucHJlc2Vuc2ktc2VzaXMudmlldyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjQ6ImYxZDk5NjEzMDg4ZWFjMWIwMjE5YWUwNTBlODk1Y2U1ZDBkYTlhMDk4OWZmYjU5NjA0NDEwMGI5NDJkZTdiY2UiO3M6NjoidGFibGVzIjthOjY6e3M6NDA6ImJhZjQzOGU4Y2U3OGMyN2FmZTg3OGJkZjQwNzBkNjE0X2NvbHVtbnMiO2E6NDp7aTowO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjI6ImlkIjtzOjU6ImxhYmVsIjtzOjI6Ik5vIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo0OiJoYXJpIjtzOjU6ImxhYmVsIjtzOjQ6IkhhcmkiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJqdW1sYWhfamFkd2FsIjtzOjU6ImxhYmVsIjtzOjEzOiJKdW1sYWggSmFkd2FsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidG90YWxfc2VzaSI7czo1OiJsYWJlbCI7czoxMDoiVG90YWwgU2VzaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiNzU1OGU2MDhjN2ViNzY4YTM0MDkzM2ZjYjU4NTFhNWRfY29sdW1ucyI7YTo4OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Mjoibm8iO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjY6ImphbV9rZSI7czo1OiJsYWJlbCI7czo2OiJKYW0gS2UiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJtYXBlbC5uYW1hIjtzOjU6ImxhYmVsIjtzOjE0OiJNYXRhIFBlbGFqYXJhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjM7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6OToiZ3VydS5uYW1lIjtzOjU6ImxhYmVsIjtzOjQ6Ikd1cnUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjU6ImFrdGlmIjtzOjU6ImxhYmVsIjtzOjU6IkFrdGlmIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNToidG90YWxfcGVydGVtdWFuIjtzOjU6ImxhYmVsIjtzOjE1OiJUb3RhbCBQZXJ0ZW11YW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo2O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEyOiJzdWRhaF9kaWJ1a2EiO3M6NToibGFiZWwiO3M6MTI6IlN1ZGFoIERpYnVrYSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjc7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6ODoicHJvZ3Jlc3MiO3M6NToibGFiZWwiO3M6ODoiUHJvZ3Jlc3MiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9fXM6NDA6IjUyMDllYTJjMmU3OGM4ZTQxODUzYzUxMTY3NWU5ZGVlX2NvbHVtbnMiO2E6MzI6e2k6MDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoyOiJubyI7czo1OiJsYWJlbCI7czoyOiJObyI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NDoibmFtZSI7czo1OiJsYWJlbCI7czoxMDoiTmFtYSBTaXN3YSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6InRnbF8yMDI2XzAxXzA1IjtzOjU6ImxhYmVsIjtzOjU6IjA1LzAxIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDFfMTIiO3M6NToibGFiZWwiO3M6NToiMTIvMDEiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo0O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJ0Z2xfMjAyNl8wMV8xOSI7czo1OiJsYWJlbCI7czo1OiIxOS8wMSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjU7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6InRnbF8yMDI2XzAxXzI2IjtzOjU6ImxhYmVsIjtzOjU6IjI2LzAxIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDJfMDIiO3M6NToibGFiZWwiO3M6NToiMDIvMDIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo3O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjE0OiJ0Z2xfMjAyNl8wMl8wOSI7czo1OiJsYWJlbCI7czo1OiIwOS8wMiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjg7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTQ6InRnbF8yMDI2XzAyXzE2IjtzOjU6ImxhYmVsIjtzOjU6IjE2LzAyIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6OTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDJfMjMiO3M6NToibGFiZWwiO3M6NToiMjMvMDIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxMDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDNfMDIiO3M6NToibGFiZWwiO3M6NToiMDIvMDMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxMTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDNfMDkiO3M6NToibGFiZWwiO3M6NToiMDkvMDMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxMjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDNfMTYiO3M6NToibGFiZWwiO3M6NToiMTYvMDMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxMzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDNfMjMiO3M6NToibGFiZWwiO3M6NToiMjMvMDMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxNDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDNfMzAiO3M6NToibGFiZWwiO3M6NToiMzAvMDMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxNTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDRfMDYiO3M6NToibGFiZWwiO3M6NToiMDYvMDQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxNjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDRfMTMiO3M6NToibGFiZWwiO3M6NToiMTMvMDQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxNzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDRfMjAiO3M6NToibGFiZWwiO3M6NToiMjAvMDQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDRfMjciO3M6NToibGFiZWwiO3M6NToiMjcvMDQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxOTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDVfMDQiO3M6NToibGFiZWwiO3M6NToiMDQvMDUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyMDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDVfMTEiO3M6NToibGFiZWwiO3M6NToiMTEvMDUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyMTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDVfMTgiO3M6NToibGFiZWwiO3M6NToiMTgvMDUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyMjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDVfMjUiO3M6NToibGFiZWwiO3M6NToiMjUvMDUiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyMzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDZfMDEiO3M6NToibGFiZWwiO3M6NToiMDEvMDYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyNDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDZfMDgiO3M6NToibGFiZWwiO3M6NToiMDgvMDYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyNTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDZfMTUiO3M6NToibGFiZWwiO3M6NToiMTUvMDYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyNjthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDZfMjIiO3M6NToibGFiZWwiO3M6NToiMjIvMDYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyNzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNDoidGdsXzIwMjZfMDZfMjkiO3M6NToibGFiZWwiO3M6NToiMjkvMDYiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyODthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToidG90YWxfaGFkaXIiO3M6NToibGFiZWwiO3M6NToiSGFkaXIiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyOTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMDoidG90YWxfaXppbiI7czo1OiJsYWJlbCI7czo0OiJJemluIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTE6InRvdGFsX3Nha2l0IjtzOjU6ImxhYmVsIjtzOjU6IlNha2l0IjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzE7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6InRvdGFsX2FsZmEiO3M6NToibGFiZWwiO3M6NDoiQWxmYSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiY2RkZDc4NzMyNjMzMDliZGI1MTk4Y2E0YTdhNDVmMzBfY29sdW1ucyI7YToyOntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MjoiaWQiO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjQ6ImhhcmkiO3M6NToibGFiZWwiO3M6NDoiSGFyaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiNThlNjA0N2ZkNzU1ODFjMTBlMDdmNDc1NjU4MmU3YjNfY29sdW1ucyI7YTo2OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6Mjoibm8iO3M6NToibGFiZWwiO3M6MjoiTm8iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToxO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJrZWxhcy50aW5na2F0IjtzOjU6ImxhYmVsIjtzOjc6IlRpbmdrYXQiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aToyO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEzOiJrZWxhcy5qdXJ1c2FuIjtzOjU6ImxhYmVsIjtzOjc6Ikp1cnVzYW4iO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTozO2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjExOiJrZWxhcy5ub21vciI7czo1OiJsYWJlbCI7czo1OiJOb21vciI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjQ7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTA6ImtlbGFzLm5hbWEiO3M6NToibGFiZWwiO3M6MTA6Ik5hbWEgS2VsYXMiO3M6ODoiaXNIaWRkZW4iO2I6MDtzOjk6ImlzVG9nZ2xlZCI7YjoxO3M6MTI6ImlzVG9nZ2xlYWJsZSI7YjowO3M6MjQ6ImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI7Tjt9aTo1O2E6Nzp7czo0OiJ0eXBlIjtzOjY6ImNvbHVtbiI7czo0OiJuYW1lIjtzOjEwOiJtYXBlbC5uYW1hIjtzOjU6ImxhYmVsIjtzOjE0OiJNYXRhIFBlbGFqYXJhbiI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO319czo0MDoiYzU0MWQ4MzQ1Yzg5YzI2NGNhNTc2OTg5MmMzYzRmMmRfY29sdW1ucyI7YTo1OntpOjA7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6NzoidGFuZ2dhbCI7czo1OiJsYWJlbCI7czo3OiJUYW5nZ2FsIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MTthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxMToiaGFyaV90YW1waWwiO3M6NToibGFiZWwiO3M6NDoiSGFyaSI7czo4OiJpc0hpZGRlbiI7YjowO3M6OToiaXNUb2dnbGVkIjtiOjE7czoxMjoiaXNUb2dnbGVhYmxlIjtiOjA7czoyNDoiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjtOO31pOjI7YTo3OntzOjQ6InR5cGUiO3M6NjoiY29sdW1uIjtzOjQ6Im5hbWUiO3M6MTM6ImphZHdhbC5qYW1fa2UiO3M6NToibGFiZWwiO3M6NjoiSmFtIEtlIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6MzthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czoxNzoiamFkd2FsLm1hcGVsLm5hbWEiO3M6NToibGFiZWwiO3M6MTQ6Ik1hdGEgUGVsYWphcmFuIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fWk6NDthOjc6e3M6NDoidHlwZSI7czo2OiJjb2x1bW4iO3M6NDoibmFtZSI7czo2OiJzdGF0dXMiO3M6NToibGFiZWwiO3M6NjoiU3RhdHVzIjtzOjg6ImlzSGlkZGVuIjtiOjA7czo5OiJpc1RvZ2dsZWQiO2I6MTtzOjEyOiJpc1RvZ2dsZWFibGUiO2I6MDtzOjI0OiJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiO047fX19fQ==', 1778934958);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_ajarans`
--

CREATE TABLE `tahun_ajarans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `starts_at` date NOT NULL,
  `ends_at` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `promotion_processed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tahun_ajarans`
--

INSERT INTO `tahun_ajarans` (`id`, `name`, `starts_at`, `ends_at`, `is_active`, `promotion_processed_at`, `created_at`, `updated_at`) VALUES
(1, '2025/2026', '2025-07-01', '2026-06-30', 1, '2026-05-16 12:36:26', '2026-05-06 16:03:10', '2026-05-16 12:36:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'siswa',
  `username` varchar(255) DEFAULT NULL,
  `nis` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wali_kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kelas_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `keterangan_nonaktif` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `username`, `nis`, `remember_token`, `created_at`, `updated_at`, `wali_kelas_id`, `kelas_id`, `is_active`, `keterangan_nonaktif`) VALUES
(1, 'Kesiswaan SMK AL Hafidz', 'admin@smkalhafidz', NULL, '$2y$12$8R0tMVpidOgDXDgRaFEzgOoeZosmaK/Pb24ewVAHENE5C1GtxXnQK', 'admin', 'kesiswaan@smkalhafidz', NULL, 'iBSmElXqwD5UQJdp7XjB5Ahmdy1CA4XRz2uhvCV85Y1lFkjGFrEeahRsL5rc', '2026-02-25 00:21:43', '2026-03-10 13:41:57', NULL, NULL, 1, NULL),
(2, 'Sintia Sari', 'sintia@gmail.com', NULL, '$2y$12$fhvQTIN5Tdc./xLjIENzxeYHlKKAXAv9mkhdyln0HF6D7Z2hfJJdC', 'guru', 'sintia@gmail.com', NULL, NULL, '2026-02-27 01:11:46', '2026-04-02 03:40:27', 22, NULL, 1, NULL),
(6, 'Ahmad Al-Faqih Assasi', NULL, NULL, '$2y$12$84gYg1DXHfcmcMDJNkwAY.0SHIui/zh1iLtDqSjNIkvqKMPnCbrSS', 'siswa', '0110222021', '0110222021', NULL, '2026-02-28 00:41:46', '2026-05-16 12:36:26', NULL, 10, 1, 'Dikeluarkan'),
(7, 'Bagus Achmad Hidayat', NULL, NULL, '$2y$12$5iJY1XurM4We1QM67cDOIuX1OqTuKbCStUYTu7zES17vQDRo5iVMu', 'siswa', '0110222002', '0110222002', NULL, '2026-02-28 02:17:12', '2026-05-16 12:36:26', NULL, 13, 1, NULL),
(11, 'Aulia Rahman', 'agam@gmail.com', NULL, '$2y$12$da3HeyZZNgwhnay0D6L4NuYWxK5fHQq3Crgwfsz0Nx07Bo4zpIKDe', 'guru', 'agam@gmail.com', NULL, NULL, '2026-02-28 16:11:04', '2026-04-02 09:05:26', NULL, NULL, 1, NULL),
(25, 'Adit Sulistiawan', NULL, NULL, '$2y$12$WlyjwEmmqASwd6rPEh/emuyxiCImqT1RF3kfL5dhl9xJP69l/Rcgy', 'siswa', '0110222555', '0110222555', NULL, '2026-03-05 03:43:35', '2026-05-16 12:36:26', NULL, 12, 1, NULL),
(27, 'Deva Lubna', NULL, NULL, '$2y$12$rsRYow4DWM661t5bqZcBseQy6ISP0bNHbLAPXfaXLlTBfIilKDNIm', 'siswa', '0110222212', '0110222212', NULL, '2026-03-07 02:10:04', '2026-05-16 12:36:26', NULL, 13, 1, NULL),
(30, 'Denis Kurniawan', NULL, NULL, '$2y$12$XvAhOM4Bv7Dw0FkSSmdqXehGZMlTlevf5KEuuuQOJCBpafCRa0yVG', 'siswa', '0110222505', '0110222505', NULL, '2026-03-08 00:49:31', '2026-05-16 12:36:26', NULL, 12, 1, NULL),
(31, 'SInta Amanda', NULL, NULL, '$2y$12$xsbFScX4.NdFNaLJKTHKDuskiB4WMUEkCkuwHUNWbv0/bt1R.d9PC', 'siswa', '0110222009', '0110222009', NULL, '2026-03-09 15:53:17', '2026-05-16 12:36:26', NULL, 13, 1, NULL),
(33, 'Qotrun Nada', 'sqotrunada121@gmail.com', NULL, '$2y$12$6p0JK5QryDG.fv9AZr2JtuvBl1/UK1xVioQB2HuD12lbYAybmqMra', 'guru', 'sqotrunada121@gmail.com', NULL, NULL, '2026-04-02 06:00:53', '2026-04-21 13:11:17', NULL, NULL, 1, NULL),
(35, 'Haikal Ridho', NULL, NULL, '$2y$12$OaIgNqzHC.bsWYQmSP9zLuZAqTt5bG9WdObRz/M0kE1bUOoOcGNq2', 'siswa', '0110222302', '0110222302', NULL, '2026-04-23 13:45:20', '2026-05-16 12:36:26', NULL, 12, 1, 'Lulus'),
(36, 'Yanuar Rahma', NULL, NULL, '$2y$12$tT6l5LvtPaBkgImuGzHnA.mModWgZIRulE8rpWcxI72Aeygzh8qCC', 'siswa', '0110222015', '0110222015', NULL, '2026-04-23 13:45:20', '2026-05-16 12:36:26', NULL, 13, 1, NULL),
(37, 'Muhammad Risky', NULL, NULL, '$2y$12$VXPItfcZQEE1cbMizYF8mOyuqOnehroFaGOVYLwxG5N/kIR9DNEVq', 'siswa', '0110222125', '0110222125', NULL, '2026-05-16 12:30:58', '2026-05-16 12:36:26', NULL, NULL, 0, 'Lulus');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwals_kelas_id_hari_jam_ke_unique` (`kelas_id`,`hari`,`jam_ke`),
  ADD KEY `jadwals_mapel_id_foreign` (`mapel_id`),
  ADD KEY `jadwals_guru_id_foreign` (`guru_id`),
  ADD KEY `jadwals_semester_akademik_id_foreign` (`semester_akademik_id`);

--
-- Indeks untuk tabel `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indeks untuk tabel `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `jurusans`
--
ALTER TABLE `jurusans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jurusans_nama_unique` (`nama`),
  ADD UNIQUE KEY `jurusans_singkatan_unique` (`singkatan`);

--
-- Indeks untuk tabel `kalender_akademiks`
--
ALTER TABLE `kalender_akademiks`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kelas_nama_unique` (`nama`),
  ADD KEY `kelas_tingkat_jurusan_index` (`tingkat`,`jurusan`),
  ADD KEY `kelas_next_kelas_id_foreign` (`next_kelas_id`);

--
-- Indeks untuk tabel `mapels`
--
ALTER TABLE `mapels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mapels_nama_unique` (`nama`),
  ADD UNIQUE KEY `mapels_kode_unique` (`kode`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `presensi_details`
--
ALTER TABLE `presensi_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presensi_details_presensi_sesi_id_siswa_id_unique` (`presensi_sesi_id`,`siswa_id`),
  ADD KEY `presensi_details_siswa_id_foreign` (`siswa_id`);

--
-- Indeks untuk tabel `presensi_sesis`
--
ALTER TABLE `presensi_sesis`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presensi_sesis_jadwal_id_tanggal_unique` (`jadwal_id`,`tanggal`),
  ADD KEY `presensi_sesis_dibuka_oleh_foreign` (`dibuka_oleh`),
  ADD KEY `presensi_sesis_ditutup_oleh_foreign` (`ditutup_oleh`);

--
-- Indeks untuk tabel `riwayat_kelas_siswas`
--
ALTER TABLE `riwayat_kelas_siswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_class_histories_siswa_id_foreign` (`siswa_id`),
  ADD KEY `student_class_histories_from_kelas_id_foreign` (`from_kelas_id`),
  ADD KEY `student_class_histories_to_kelas_id_foreign` (`to_kelas_id`),
  ADD KEY `student_class_histories_processed_by_foreign` (`processed_by`),
  ADD KEY `riwayat_kelas_siswas_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indeks untuk tabel `semester_akademiks`
--
ALTER TABLE `semester_akademiks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `semester_akademiks_tahun_ajaran_id_foreign` (`tahun_ajaran_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `tahun_ajarans`
--
ALTER TABLE `tahun_ajarans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_nis_unique` (`nis`),
  ADD KEY `users_wali_kelas_id_foreign` (`wali_kelas_id`),
  ADD KEY `users_kelas_id_foreign` (`kelas_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jurusans`
--
ALTER TABLE `jurusans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kalender_akademiks`
--
ALTER TABLE `kalender_akademiks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `mapels`
--
ALTER TABLE `mapels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `presensi_details`
--
ALTER TABLE `presensi_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT untuk tabel `presensi_sesis`
--
ALTER TABLE `presensi_sesis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT untuk tabel `riwayat_kelas_siswas`
--
ALTER TABLE `riwayat_kelas_siswas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `semester_akademiks`
--
ALTER TABLE `semester_akademiks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tahun_ajarans`
--
ALTER TABLE `tahun_ajarans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `jadwals`
--
ALTER TABLE `jadwals`
  ADD CONSTRAINT `jadwals_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `jadwals_semester_akademik_id_foreign` FOREIGN KEY (`semester_akademik_id`) REFERENCES `semester_akademiks` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_next_kelas_id_foreign` FOREIGN KEY (`next_kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `presensi_details`
--
ALTER TABLE `presensi_details`
  ADD CONSTRAINT `presensi_details_presensi_sesi_id_foreign` FOREIGN KEY (`presensi_sesi_id`) REFERENCES `presensi_sesis` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `presensi_details_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `presensi_sesis`
--
ALTER TABLE `presensi_sesis`
  ADD CONSTRAINT `presensi_sesis_dibuka_oleh_foreign` FOREIGN KEY (`dibuka_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `presensi_sesis_ditutup_oleh_foreign` FOREIGN KEY (`ditutup_oleh`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `presensi_sesis_jadwal_id_foreign` FOREIGN KEY (`jadwal_id`) REFERENCES `jadwals` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `riwayat_kelas_siswas`
--
ALTER TABLE `riwayat_kelas_siswas`
  ADD CONSTRAINT `riwayat_kelas_siswas_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`),
  ADD CONSTRAINT `student_class_histories_from_kelas_id_foreign` FOREIGN KEY (`from_kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_class_histories_processed_by_foreign` FOREIGN KEY (`processed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `student_class_histories_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `student_class_histories_to_kelas_id_foreign` FOREIGN KEY (`to_kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL;

--
-- Ketidakleluasaan untuk tabel `semester_akademiks`
--
ALTER TABLE `semester_akademiks`
  ADD CONSTRAINT `semester_akademiks_tahun_ajaran_id_foreign` FOREIGN KEY (`tahun_ajaran_id`) REFERENCES `tahun_ajarans` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `users_wali_kelas_id_foreign` FOREIGN KEY (`wali_kelas_id`) REFERENCES `kelas` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
