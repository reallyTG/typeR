library(rlm)


### Name: rlm
### Title: rlm
### Aliases: rlm

### ** Examples

y <- matrix( c(2, 4, 3, 1, 5, 7), nrow=3,  ncol=2) 
x <- c(1, 2, 3)
w <- c(0.9, 0.8, 0.7)
rlm::rlm(y~x, weights = w)



