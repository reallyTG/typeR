library(B2Z)


### Name: B2ZM_MCMC
### Title: Bayesian Two-Zone Models: using Gibbs with Metropolis step
### Aliases: B2ZM_MCMC
### Keywords: models

### ** Examples


##################
#Dependent Model#
################

#Data 1:  100 simulated concentrations during the times
#between 0 and 4, using the parameters Beta = 5, Q = 13.8,
#G = 351.5, VN = pi*10^-3, VF = 3.8, Tau_N = 1, 
#Tau_NF = 0.5 and Tau_F = 0.64. 

data(ex1)
#Without specifying the initial values and 
#the covariance matrix in the proposal distribution

## Not run: 
##D r <- B2ZM_MCMC(data = ex1, priorBeta = "unif(0,10)",   
##D      priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
##D      v = 4, VN = pi*10^-3, VF = 3.8, NUpd = 10000, burnin = 1000, 
##D      lag = 1, m = 5000)
##D 
##D summary(r)
##D plot(r)
## End(Not run)

#Specifying the initial values and the covariance matrix in the proposal distribution
initial <- c(5.338671,  14.147149, 379.591927)

Sigma.Cand <- matrix(c(0.51306,  0.54981,   14.4306,
                       0.54981,  1.75525,   35.5525,
                       14.4306,  35.5525, 1360.5119),3,3)

r <- B2ZM_MCMC(data = ex1, priorBeta = "unif(0,10)", 
     priorQ = "unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
     v = 4, VN = pi*10^-3, VF = 3.8, NUpd = 1000, burnin = 100, 
     lag = 1, m = 5000, initial = initial, Sigma.Cand = Sigma.Cand)

summary(r)
plot(r)

## Not run: 
##D #Saving figures with .jpg extension
##D r <- B2ZM_MCMC(data = ex1, priorBeta = "unif(0,10)", 
##D      priorQ = "unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
##D      v = 4, VN = pi*10^-3, VF = 3.8, NUpd = 10000, burnin = 1000, 
##D      lag = 1, m = 5000, figures = list(save = TRUE, type ="jpg") )
## End(Not run)


#####################
#Independent Model #
###################

#Data 2:  100 simulated concentrations during the times
#between 0 and 4, using the parameters Beta = 5, Q = 13.8,
#G = 351.5, VN = pi*10^-3, VF = 3.8, Tau_N = 1, 
#Tau_NF = 0 and Tau_F = 0.64. 

## Not run: 
##D data(ex2)
##D 
##D #Without specifying the initial values and the 
##D #covariance matrix in the proposal distribution
##D 
##D r <- B2ZM_MCMC(data = ex2, indep.model = TRUE, 
##D      priorBeta = "unif(0,10)", priorQ="unif(11,17)", 
##D      priorG = "unif(281,482)", tauN.sh = 5 , tauN.sc = 4 , 
##D      tauF.sh = 5, tauF.sc = 7 , VN = pi*10^-3, VF = 3.8,
##D      NUpd = 10000, burnin = 1000, lag = 1, m = 1000)
##D 
##D summary(r)
##D plot(r)
## End(Not run)




