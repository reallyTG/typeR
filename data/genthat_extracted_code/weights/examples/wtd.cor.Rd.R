library(weights)


### Name: wtd.cor
### Title: Produces weighted correlations with standard errors and
###   significance. For a faster version without standard errors and p
###   values, use the 'wtd.cors' function.
### Aliases: wtd.cor onecor.wtd
### Keywords: ~correlation ~Pearson ~weights ~bootstrap

### ** Examples

test <- c(1,1,1,1,1,1,2,2,2,3,3,3,4,4)
t2 <- rev(test)
weight <- c(.5,.5,.5,.5,.5,1,1,1,1,2,2,2,2,2)

wtd.cor(test, t2)
wtd.cor(test, t2, weight)
wtd.cor(test, t2, weight, bootse=TRUE)



