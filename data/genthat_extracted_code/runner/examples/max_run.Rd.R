library(runner)


### Name: max_run
### Title: Running maximum
### Aliases: max_run

### ** Examples

set.seed(11)
x1 <- sample(c(1,2,3), 15, replace=TRUE)
x2 <- sample(c(NA,1,2,3), 15, replace=TRUE)
k  <- sample(1:4, 15,replace=TRUE)
max_run(x1) # simple cumulative minimum
max_run(x2, na_rm = TRUE) # cumulative minimum with removing NA.
max_run(x2, na_rm = TRUE, k=4) # minimum in 4-element window
max_run(x2, na_rm = FALSE, k=k) # minimum in varying k window size



