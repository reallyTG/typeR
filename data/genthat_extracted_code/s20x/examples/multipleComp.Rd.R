library(s20x)


### Name: multipleComp
### Title: Multiple Comparisons
### Aliases: multipleComp
### Keywords: htest

### ** Examples


## computer data
data(computer.df)
fit = lm(score ~ factor(selfassess), data = computer.df)
multipleComp(fit)




