library(pwr)


### Name: plot.power.htest
### Title: Plot diagram of sample size vs. test power
### Aliases: plot.power.htest
### Keywords: htest

### ** Examples


## Two-sample t-test
p.t.two <- pwr.t.test(d=0.3, power=0.8, type="two.sample", alternative="two.sided")
plot(p.t.two)
plot(p.t.two, xlab="sample size per group")




