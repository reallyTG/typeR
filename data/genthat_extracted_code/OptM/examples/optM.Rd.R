library(OptM)


### Name: optM
### Title: optM function
### Aliases: optM
### Keywords: optM

### ** Examples

# Load a folder of simulated test data for m = 3
folder <- system.file("extdata", package = "OptM")
test.optM = optM(folder)

# To view the various linear modeling estimates:
   # test.linear = optM(folder, method = "linear")

# To view the results from the SiZer package:
   # test.sizer = optM(folder, method = "SiZer")



