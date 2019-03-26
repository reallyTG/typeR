library(AGread)


### Name: collapse_gt3x
### Title: Collapse data that were read using 'read_gt3x'
### Aliases: collapse_gt3x collapse_gt3x.RAW collapse_gt3x.IMU

### ** Examples

## No test: 
file <- system.file(
  "extdata",
  "example.gt3x",
  package = "AGread"
)
data <- read_gt3x(file)
collapse_gt3x(data$RAW)
collapse_gt3x(data$IMU)
## End(No test)



