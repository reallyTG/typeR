library(asht)


### Name: meldCD
### Title: Meld Two Confidence Distributions
### Aliases: meldCD
### Keywords: htest

### ** Examples

x1<-4
n1<-11
x2<- 13
n2<-24


#  we use the upper and lower CDs
# this is needed for discrete data to ensure valid intervals
H1L<-function(theta){ pbeta(theta,x1,n1-x1+1)}
# Note, this is just a p-value function that inputs the null boundary value: 
binom.test(x1,n1,p=.4,alternative="greater")$p.value
H1L(.4)
H1U<-function(theta){ pbeta(theta,x1+1,n1-x1)}
# Note, but this is just a function for 1-p that inputs the null boundary value: 
1-binom.test(x1,n1,p=.4,alternative="less")$p.value
H1U(.4)
H2L<-function(theta){ pbeta(theta,x2,n2-x2+1)}
H2U<-function(theta){ pbeta(theta,x2+1,n2-x2)}

meldCD(H1U,H2L, lim=c(0,1),conf.level=0.975,alternative="greater")
meldCD(H1L,H2U, lim=c(0,1),conf.level=0.975,alternative="less")
# notice that the estimates are different than the usual 
# difference in sample proportions
require(exact2x2)
binomMeld.test(x1,n1,x2,n2, conf.level=0.975, alternative="greater")
# compare to two-.sided from 
binomMeld.test(x1,n1,x2,n2, conf.level=0.95, alternative="two.sided")




