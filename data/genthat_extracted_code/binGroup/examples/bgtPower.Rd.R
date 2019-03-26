library(binGroup)


### Name: bgtPower
### Title: Power to Reject a Hypothesis in Binomial Group Testing for One
###   Proportion
### Aliases: bgtPower bgtPowerI
### Keywords: htest

### ** Examples


# Calculate the power for the design
# in the example given in Tebbs and Bilder(2004):
# n=24 groups each containing 7 insects
# if the true proportion of virus vectors
# in the population would be 0.04 (4 percent),
# the power to reject H0: p>=0.1 using an
# upper Clopper-Pearson ("CP") confidence interval
# can be calculated using the following call:

bgtPower(n=24, s=7, delta=0.06, p.hyp=0.1,
 conf.level=0.95, alternative="less", method="CP")


# c(), seq() or rep() might be used to explore development
# of power and bias for varying n, s, delta. How much can
# we decrease the number of groups (costly assays to be performed)
# by pooling the same number of 320 individuals to groups of
# increasing size without largely decreasing power?

bgtPower(n=c(320,160,80,64,40,32,20,10,5),
 s=c(1,2,4,5,8,10,16,32,64),
 delta=0.01, p.hyp=0.02)


# How does power develop for increasing differences
# delta between the true proportion and the threshold proportion?

bgtPower(n=50, s=10, delta=seq(from=0, to=0.01, by=0.001),
 p.hyp=0.01, method="CP")


# use a more liberal method:

bgtPower(n=50, s=10, delta=seq(from=0, to=0.01, by=0.001),
 p.hyp=0.01, method="SOC")




