library(loose.rock)


### Name: balanced.train.and.test
### Title: Get a balanced test and train dataset
### Aliases: balanced.train.and.test

### ** Examples

set1 <- seq(20)
balanced.train.and.test(set1, train.perc = .9)
####
set.seed(1985)
set1 <- rbinom(20, prob = 3/20, size = 1) == 1
balanced.train.and.test(set1, train.perc = .9)
####
set1 <- c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,
TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE,TRUE)
set2 <- !set1
balanced.train.and.test(set1, set2, train.perc = .9)



