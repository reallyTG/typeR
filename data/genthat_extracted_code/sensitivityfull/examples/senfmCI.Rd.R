library(sensitivityfull)


### Name: senfmCI
### Title: Sensitivity Analysis for a Confidence Interval in a Full Match.
### Aliases: senfmCI
### Keywords: htest robust

### ** Examples

# The artificial example that follows has I=9
# matched sets.  The first 3 sets have one treated
# individual and two controls with treated subjects
# in column 1.  The next 3 sets are
# matched pairs, with treated subjects in column 1.
# The next 3 sets have one control and two treated
# subjects, with the control in column 1.  Simulated
# from a Normal distribution with an additive effect
# of tau=1.

y<-c(2.2, 1.4, 1.6, 2.4, 0.7, 1.3, 1.2, 0.6, 0.3,
0.5, -0.1, -1.3, -0.3, 0.1, 0.4, 3.0, 1.1, 1.4, -0.8,
0.1, 0.8, NA, NA, NA, 1.1, 0.5, 1.8)
y<-matrix(y,9,3)
treated1<-c(rep(TRUE,6),rep(FALSE,3))

# Randomization interval and point estimate, Huber scores:
senfmCI(y,treated1)

# Uses senfm() to show how senfmCI() inverts the test.
senfm(y,treated1,tau=0.6172307) #P-value is 0.025
senfm(y,treated1,tau=2.0612746,alternative = "less") #P-value is 0.025
senfm(y,treated1,tau=1.345436) #Statistic is 0

senfmCI(y,treated1,gamma=1.5) #Sensitivity of two-sided CI
# The next two calculations relate one and two-sided intervals
senfmCI(y,treated1,gamma=1.5,twosided=FALSE,upper=TRUE,alpha=0.025)
senfmCI(y,treated1,gamma=1.5,twosided=FALSE,upper=FALSE,alpha=0.025)

# If an estimator is approximately Normal, then +/- a standard
# error is approximately a 2/3 confidence interval.  Going the
# other way, people sometimes suggest looking at a 2/3
# confidence interval as analogous to +/- a standard error.
senfmCI(y,treated1,gamma=1.5,alpha=1/3)

# For an additional example, install and load package sensitivitymw
# library(sensitivitymw)
# The mercury data is 397 triples, 1 treated, 2 controls.
# It is the example in Rosenbaum (2014).
# data(mercury)
# help(mercury)
# In this balanced design, senmwCI() and senfmCI() give the same CI.
# senmwCI(mercury,gamma=3)
# senfmCI(mercury,rep(TRUE,397),gamma=3,twosided=FALSE)



