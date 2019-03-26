library(runner)


### Name: streak_run
### Title: Running streak length
### Aliases: streak_run

### ** Examples

set.seed(11)
x1 <- sample(c("a","b"),15,replace=TRUE)
x2 <- sample(c(NA_character_,"a","b"),15,replace=TRUE)
k <- sample(1:4,15,replace=TRUE)
streak_run(x1) # simple streak run
streak_run(x1, k=2) # streak run within 2-element window
streak_run(x2, na_pad=TRUE, k=3) # streak run within k=3 with padding NA
streak_run(x1, k=k) # streak run within varying window size specified by vector k



