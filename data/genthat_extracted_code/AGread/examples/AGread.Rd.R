library(AGread)


### Name: AGread
### Title: Read Data Files from ActiGraph Monitors
### Aliases: AGread AGread-package

### ** Examples

## No test: 
read_AG_counts(
  system.file(
  "extdata",
  "example1sec.csv",
  package = "AGread"
  ),
  skip = 11
)
read_AG_raw(
  system.file(
  "extdata",
  "TestID_LeftWrist_RAW.csv",
  package = "AGread"
  )
)
read_AG_IMU(
  system.file(
  "extdata",
  "example-IMU.csv",
  package = "AGread"
  )
)
file_3x <- system.file(
  "extdata", "example.gt3x", package = "AGread"
)
read_gt3x(file_3x)
## End(No test)




