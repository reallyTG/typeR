library(B2Z)


### Name: B2ZM_BCLT
### Title: Bayesian Two-Zone Models: using Bayesian Central Limit Theorem
###   (BCLT) - Laplace Approximation
### Aliases: B2ZM_BCLT
### Keywords: models

### ** Examples

#####################
#Independent Model #
###################

#Data 1:  100 simulated concentrations during the times between 

#0 and 4, using the parameters Beta = 5, Q = 13.8, G = 351.5, 

#VN = pi*10^-3 VF = 3.8, Tau_N = 1, Tau_NF = 0.5 

#and Tau_F = 0.64. 
## Not run: 
##D 
##D data(ex1)
##D 
##D r <- B2ZM_BCLT(data = ex1, priorBeta = "unif(0,10)",
##D                priorQ="unif(11,17)", priorG = "unif(281,482)", 
##D                S = diag(10,2), v = 4, VN = pi*10^-3, VF = 3.8, 
##D                m = 7000, sample_size=2000)
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D #####################
##D #Independent Model #
##D ###################
##D 
##D #Data 2:  100 simulated concentrations during the times between 
##D 
##D #0 and 4, using the parameters Beta = 5, Q = 13.8, G = 351.5, 
##D 
##D #VN = pi*10^-3, VF = 3.8, Tau_N = 1, Tau_NF = 0 
##D 
##D #and Tau_F = 0.64. 
##D 
##D data(ex2)
##D 
##D 
##D r <- B2ZM_BCLT(data = ex2, priorBeta = "unif(0,10)",
##D                priorQ="unif(11,17)", priorG = "unif(281,482)",
##D                tauN.sh = 5 , tauN.sc = 4 , tauF.sh = 5,
##D                tauF.sc = 7, VN = pi*10^-3, VF = 3.8, 
##D                indep.model = TRUE, m = 7000, sample_size=2000)
##D 
##D summary(r)
##D plot(r)
## End(Not run)



