library(AGread)


### Name: get_imu_file_meta
### Title: Get file metadata (sampling frequency, start time, and samples
###   per epoch) for IMU
### Aliases: get_imu_file_meta

### ** Examples

imu_file <-
    system.file("extdata",
    "example-IMU.csv",
    package = "AGread")

get_imu_file_meta(imu_file)




