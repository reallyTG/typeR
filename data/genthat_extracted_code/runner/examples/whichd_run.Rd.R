library(runner)


### Name: whichd_run
### Title: Index of previous, different element
### Aliases: whichd_run

### ** Examples

set.seed(11)
x1 <- sample(c("a","b"),15,replace=TRUE)
x2 <- sample(c(NA_character_,"a","b"),15,replace=TRUE)
k  <- sample(1:4,15,replace=TRUE)
whichd_run(x1)
whichd_run(x1, k=2)
whichd_run(x2, na_pad=TRUE, k=3)
whichd_run(x1, k=k)



