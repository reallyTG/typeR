library(lmridge)


### Name: rstats1.lmridge
### Title: Ordinary Ridge Regression Statistics 1
### Aliases: rstats1 rstats1.lmridge print.rstats1
### Keywords: ridge statistics ridge condition number

### ** Examples

data(Hald)
mod <- lmridge(y~., data = as.data.frame(Hald), K = seq(0,0.2, 0.005) )
rstats1(mod)



