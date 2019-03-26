library(B2Z)


### Name: B2ZM_SIR
### Title: Bayesian Two-Zone Models: using SIR sampler
### Aliases: B2ZM_SIR
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

r <- B2ZM_SIR(data = ex1,  priorBeta = "unif(0,10)",   
     priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
     v = 4, VN = pi*10^-3, VF = 3.8, m = 100 )

#plot(r)
#summary(r)

#Saving figures with .png extension
## Not run: 
##D r <- B2ZM_SIR(data = ex1, priorBeta = "unif(0,10)",    
##D      priorQ = "unif(11,17)", priorG = "unif(281,482)", 
##D      S = diag(10,2), v = 4, VN = pi*10^-3, VF = 3.8, 
##D      m = 10000, figures = list(save = TRUE, type ="png"))
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
##D r <- B2ZM_SIR(data = ex2, indep.model = TRUE, 
##D      priorBeta = "unif(0,10)", priorQ="unif(11,17)", 
##D      priorG = "unif(281,482)", tauN.sh = 5 , tauN.sc = 4 , 
##D      tauF.sh = 5, tauF.sc = 7 , VN = pi*10^-3, 
##D      VF = 3.8, m = 100)
##D 
##D plot(r)
##D summary(r)
## End(Not run)




