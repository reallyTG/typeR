library(AGread)


### Name: check_columns
### Title: Check if the primary accelerometer file is formatted correctly
### Aliases: check_columns

### ** Examples

raw_file <-
    system.file("extdata",
    "TestID_LeftWrist_RAW.csv",
    package = "AGread")

check_columns(raw_file, skip = 10)




