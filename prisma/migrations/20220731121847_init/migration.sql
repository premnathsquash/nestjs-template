-- CreateTable
CREATE TABLE `event` (
    `name` VARCHAR(255) NOT NULL,
    `markup` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    `timeToStart` DATETIME(0) NOT NULL,
    `id` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `IDX_b535fbe8ec6d832dde22065ebd`(`name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `user` (
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `firstName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `confirmationCode` VARCHAR(255) NULL,
    `state` VARCHAR(255) NOT NULL DEFAULT 'inactive',
    `role` INTEGER NOT NULL DEFAULT 0,
    `markup` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,
    `socialSecNum` INTEGER NULL,
    `patronId` VARCHAR(255) NULL,
    `otp` VARCHAR(255) NULL,
    `DOB` DATE NULL,
    `image` LONGBLOB NULL,
    `created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    `eventId` VARCHAR(255) NULL,
    `id` VARCHAR(191) NOT NULL,
    `amount` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,

    UNIQUE INDEX `IDX_e12875dfb3b1d92d7d7c5377e2`(`email`),
    UNIQUE INDEX `IDX_18f7354ddbd40596539ba9a40a`(`confirmationCode`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `connection` (
    `id` VARCHAR(36) NOT NULL,
    `userId1ID` VARCHAR(36) NULL,
    `userId2ID` VARCHAR(36) NULL,
    `amount` DECIMAL(10, 2) NOT NULL DEFAULT 0.00,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `connection` ADD CONSTRAINT `connection_userId1ID_fkey` FOREIGN KEY (`userId1ID`) REFERENCES `user`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
