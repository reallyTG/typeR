library(npsp)


### Name: kappasb
### Title: Coefficients of an extended Shapiro-Botha variogram model
### Aliases: kappasb

### ** Examples

kappasb(seq(0, 6*pi, len = 10), 2)
  
curve(kappasb(x/5, 0), xlim = c(0, 6*pi), ylim = c(-1, 1), lty = 2)
for (i in 1:10) curve(kappasb(x, i), col = gray((i-1)/10), add = TRUE)
abline(h = 0, lty = 3)



