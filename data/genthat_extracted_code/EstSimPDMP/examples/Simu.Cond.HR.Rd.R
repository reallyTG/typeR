library(EstSimPDMP)


### Name: Simu.Cond.HR
### Title: Simulation of random variables from their conditional hazard
###   rate function
### Aliases: Simu.Cond.HR

### ** Examples

# Simu.Cond.HR
example<-function(x,t){
	sqrt(sum(x^2))+t
}

# Simulations of 50 iid random variables with hazard rate=example given x=3
Simu.Cond.HR(50,example,3)

# Simulations of 50 iid random variables with hazard rate=example given x=0.5
# Simu.Cond.HR(50,example,0.5)



