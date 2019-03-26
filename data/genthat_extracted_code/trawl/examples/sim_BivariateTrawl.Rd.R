library(trawl)


### Name: sim_BivariateTrawl
### Title: Simulates a bivariate trawl process
### Aliases: sim_BivariateTrawl

### ** Examples

#Simulate a bivariate negative binomial trawl process with exponential trawl
#functions
#Parameters of the exponential trawls:
lambda1 <- 1.2
lambda2 <- 1.5
#Parameters of the negative binomial marginal law:
m1 <- 2.1
theta1 <- 0.9
a1 <- 27.3
m2 <- 2.3
theta2 <- 0.9
a2 <- 35.3
kappa12 <- m1
kappa1 <- 0
kappa2 <- m2 - kappa12
#Specify the time period and grid
t <- 720
Delta <- 1
#Fix the seed
set.seed(1)
#Simulate the bivariate trawl process with common factor
#and independent components ("dep") and negative binomial
# marginal law. Both trawl functions are chosen as exponentials.
simdata <- sim_BivariateTrawl(t, Delta, burnin=10,marginal ="NegBin",
dependencetype="dep", trawl1 ="Exp", trawl2 ="Exp",
kappa1=kappa1,kappa2=kappa2,kappa12=kappa12,a1=a1,a2=a2,lambda11=lambda1,
lambda21 =lambda2)



