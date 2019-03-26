library(AGread)


### Name: get_raw_file_meta
### Title: Get file metadata (sampling frequency and timestamps) for
###   primary accelerometer
### Aliases: get_raw_file_meta

### ** Examples

raw_file <-
    system.file("extdata",
    "TestID_LeftWrist_RAW.csv",
    package = "AGread")

get_raw_file_meta(raw_file)




