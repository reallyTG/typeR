library(nivm)


### Name: powerNicqTest
### Title: Power or Sample Size for Non-inferiority Control Quantile Test
### Aliases: powerNicqTest
### Keywords: htest

### ** Examples

# to calculate power, leave power=NULL and supply n1 and n2
powerNicqTest(n1=200,n2=300)
# or supply n1 and n2.over.n1
powerNicqTest(n1=200,n2.over.n1=3/2)
## to calculate n1 and n2, supply power
## find minimum n1 that have power greater than 0.80
## takes 13 iterations to find n1=346
## so do not run it here
#powerNicqTest(power=.80,print.steps=TRUE)



