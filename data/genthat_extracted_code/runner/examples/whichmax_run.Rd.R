library(runner)


### Name: whichmax_run
### Title: Running which.max
### Aliases: whichmax_run

### ** Examples

x1 <- c(1, 1, 2, 1, 1, 3, 1, 1, 3, 1, 1, 2, 3, 3, 3)
x2 <- c(2, 1, 1, NA, 3, 2, 1, NA, 1, NA, NA, NA, 1, 2, 1)
k  <- c(5, 1, 8, 1, 1, 15, 2, 5, 14, 2, 3, 7, 14, 13, 12)
whichmax_run(x1, which="first")
whichmax_run(x2, na_rm = TRUE, which="last")
whichmax_run(x2, k=3, na_rm = TRUE, which="last")
whichmax_run(x2 , k=k, na_rm = FALSE, which="first")



