library(lmridge)


### Name: rstats2.lmridge
### Title: Ordinary Ridge Regression Statistics 2
### Aliases: rstats2 rstats2.lmridge print.rstats2
### Keywords: ridge statistics ridge PRESS ridge effective degrees of
###   freedom

### ** Examples

data(Hald)
mod <- lmridge(y~., data=as.data.frame(Hald), K = seq(0,0.2, 0.001) )
rstats2(mod)



