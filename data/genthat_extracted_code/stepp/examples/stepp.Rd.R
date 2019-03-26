library(stepp)


### Name: stepp
### Title: Analyze survival or competing risks data
### Aliases: stepp
### Keywords: ~kwd1 ~kwd2

### ** Examples

#GENERATE TREATMENT VARIABLE:
n <- 1000		# set the sample size
mu <- 0			# set the mean and sd of the covariate
sigma <- 1

beta0 <- log(-log(0.5)) # set the intercept for the log hazard
beta1 <- -0.2		# set the slope on the covariate
beta2 <- 0.5		# set the slope on the treatment indicator
beta3 <- 0.7		# set the slope on the interaction

prob2 <- 0.2		# set the proportion type 2 events
cprob <- 0.3		# set the proportion censored

set.seed(7775432) 	# set the random number seed
covariate <- rnorm(n,mean=mu,sd=sigma)	# generate the covariate values
Txassign <- rbinom(n,1,0.5)		# generate the treatment indicator
x3 <- covariate*Txassign		# compute interaction term
					# compute the hazard for type 1 event
lambda1 <- exp(beta0+beta1*covariate+beta2*Txassign+beta3*x3)
lambda2 <- prob2*lambda1/(1-prob2)	# compute the hazard for the type 2 event
					# compute the hazard for censoring time
lambda0 <- cprob*(lambda1+lambda2)/(1-cprob)
t1 <- rexp(n,rate=lambda1)		# generate the survival time for type 1 event
t2 <- rexp(n,rate=lambda2)		# generate the survival time for type 2 event
t0 <- rexp(n,rate=lambda0)		# generate the censoring time
time <- pmin(t0,t1,t2)			# compute the observed survival time
type <- rep(0,n)
type[(t1 < t0)&(t1 < t2)] <- 1
type[(t2 < t0)&(t2 < t1)] <- 2

# Call stepp to analyze the data
# Warning: In this example, the permutations have been set to 0 to allow the stepp function
# to finish in a short amount of time.  IT IS RECOMMEND TO USE AT LEAST 2500 PERMUTATIONS TO 
# PROVIDE STABLE RESULTS.
steppCI <- stepp("CI", coltrt=Txassign, trts=c(0,1), coltime=time, coltype=type, 
  colvar=covariate, patspop=300, minpatspop=200, timest=1.0, noperm=0)

stepp_summary(steppCI)
stepp_print(steppCI)
stepp_plot(steppCI, 
  ncex=0.70,legendy=30,pline=-2.5,color=c("red", "black"),
  xlabel="Subpopulations by Median Age",ylabel="4-year Cancer Relapse",
  tlegend=c("Treatment A", "Treatment B"), nlas=3,pointwise=FALSE)



