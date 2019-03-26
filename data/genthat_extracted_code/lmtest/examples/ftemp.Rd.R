library(lmtest)


### Name: ftemp
### Title: Femal Temperature Data
### Aliases: ftemp
### Keywords: datasets

### ** Examples

data(ftemp)
plot(ftemp)
y <- window(ftemp, start = 8, end = 60)
if(require(strucchange)) {
  bp <- breakpoints(y ~ 1)
  plot(bp)
  fm.seg <- lm(y ~ 0 + breakfactor(bp))
  plot(y)
  lines(8:60, fitted(fm.seg), col = 4)
  lines(confint(bp))
}




