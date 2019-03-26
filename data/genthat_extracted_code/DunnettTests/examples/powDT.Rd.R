library(DunnettTests)


### Name: powDT
### Title: To calculate the testing power for step-down or step-up Dunnett
###   procedure numerically
### Aliases: powDT
### Keywords: step-up Dunnett step-down Dunnett testing power

### ** Examples

#Compare group means of four treatment arms to a control arm (upper one-sided tests)
# Setting
k <- 4
mu <- 22 #assumed mean of each treatment arm
mu0 <- 20 #assumed mean of the control arm
n <- 100
n0 <- 80
sigma <- 5 #assumed population error variance
df <- n*k+n0-k-1 #consider the t distribution

# at one-sided significance level 0.05
# compare the testing powers of SD and SU Dunnett for rejecting at least one nulls 
powSD <- powDT(r=1,k,mu,mu0,n,n0,"means",sigma=sigma,df=df,testcall="SD")
powSU <- powDT(r=1,k,mu,mu0,n,n0,"means",sigma=sigma,df=df,testcall="SU")




