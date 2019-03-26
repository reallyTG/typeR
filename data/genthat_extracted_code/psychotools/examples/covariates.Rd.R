library(psychotools)


### Name: covariates
### Title: Extract/Set Covariates
### Aliases: covariates covariates<-
### Keywords: classes

### ** Examples

## method for "paircomp" data
pc <- paircomp(rbind(
  c(1,  1,  1), # a > b, a > c, b > c
  c(1,  1, -1), # a > b, a > c, b < c
  c(1, -1, -1), # a > b, a < c, b < c
  c(1,  1,  1)))
covariates(pc)
covariates(pc) <- data.frame(foo = factor(c(1, 2, 2), labels = c("foo", "bar")))
covariates(pc)



