library(prcbench)


### Name: create_usrdata
### Title: Create a user-defined test dataset
### Aliases: create_usrdata

### ** Examples

## Create a test dataset for benchmarking
testset2 <- create_usrdata("bench", scores = c(0.1, 0.2), labels = c(1, 0),
                           tsname = "m1")
testset2

## Create a test dataset for curve evaluation
testset <- create_usrdata("curve", scores = c(0.1, 0.2), labels = c(1, 0),
                           base_x = c(0, 1.0), base_y = c(0, 0.5))
testset




