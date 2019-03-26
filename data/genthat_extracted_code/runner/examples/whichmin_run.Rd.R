library(runner)


### Name: whichmin_run
### Title: Running which.min
### Aliases: whichmin_run

### ** Examples

set.seed(11)
x1 <- c(1, 1, 2, 1, 1, 3, 1, 1, 3, 1, 1, 2, 3, 3, 3)
x2 <- c(2, 1, 1, NA, 3, 2, 1, NA, 1, NA, NA, NA, 1, 2, 1)
k  <- c(5, 1, 8, 1, 1, 15, 2, 5, 14, 2, 3, 7, 14, 13, 12)
whichmin_run( x1 , which="first") # running index of minimum
whichmin_run(x1, which="last")
whichmin_run( x2, na_rm = TRUE , which="last" ) # running min-index ommiting NA
whichmin_run(x2 , k=3, na_rm = TRUE, which="first") # running min-index in 3-element window
whichmin_run( x2 , k = k , na_rm = TRUE, which = "last") # running min-index in varying window size



