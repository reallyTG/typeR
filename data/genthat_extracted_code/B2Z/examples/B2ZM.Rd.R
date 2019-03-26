library(B2Z)


### Name: B2ZM
### Title: Bayesian Two-Zone Models
### Aliases: B2ZM
### Keywords: models

### ** Examples


##################
#Dependent Model#
################

#Data 1:  100 simulated concentrations during the times 
#between 0 and 4, using the parameters Beta = 5, Q = 13.8, 
#G = 351.5, VN = pi*10^-3, VF = 3.8, Tau_N = 1, 
#Tau_NF = 0.5 and Tau_F = 0.64. 
## Not run: 
##D data(ex1)
##D 
##D #######
##D #BCLT#
##D #####
##D 
##D r <- B2ZM(data = ex1, priorBeta = "unif(0,10)", 	
##D          priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2),  
##D          v = 4, VN = pi*10^-3, VF = 3.8, sampler = "BCLT", 
##D          bclt.control=list( m = 7000, sample_size=2000))
##D 
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D #########################
##D #METROPOLIS WITHIN GIBBS#
##D #########################
##D 
##D r <- B2ZM(data = ex1, priorBeta = "unif(0,10)",   
##D      priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
##D      v = 4, VN = pi*10^-3, VF = 3.8, sampler = "MCMC",     
##D      mcmc.control = list(NUpd = 10000, burnin = 1000, 
##D      lag = 1, m = 5000) )
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D #######
##D #IMIS#
##D #####
##D 
##D r <- B2ZM(data = ex1, priorBeta = "unif(0,10)",  
##D      priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
##D      v = 4, VN = pi*10^-3, VF = 3.8, sampler="IMIS", 
##D      imis.control = list( N0 = 6000, B = 600, M = 3000, it.max = 12))
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D ######
##D #SIR#
##D ####
##D 
##D r <- B2ZM(data = ex1, priorBeta = "unif(0,10)",  
##D      priorQ="unif(11,17)", priorG = "unif(281,482)", S = diag(10,2), 
##D      v = 4, VN = pi*10^-3, VF = 3.8, sampler="SIR", 
##D      sir.control = list(m = 10000) )
##D 
##D plot(r)
##D summary(r)
##D 
##D #######################################################################
##D 
##D #####################
##D #Independent Model #
##D ###################
##D 
##D #Data 2:  100 simulated concentrations during the times 
##D #between 0 and 4, using the parameters Beta = 5, Q = 13.8, 
##D #G = 351.5, VN = pi*10^-3, VF = 3.8, Tau_N = 1, 
##D #Tau_NF = 0 and Tau_F = 0.64. 
##D 
##D data(ex2)
##D 
##D #######
##D #BCLT#
##D #####
##D 
##D r <- B2ZM(data = ex2,  priorBeta = "unif(0,10)", 	
##D      priorQ="unif(11,17)", priorG = "unif(281,482)", 
##D      tauN.sh = 5 , tauN.sc = 4 , tauF.sh = 5, tauF.sc = 7, 
##D      VN = pi*10^-3,  VF = 3.8, sampler = "BCLT", 
##D      indep.model = TRUE, bclt.control=list(m = 7000,  
##D      sample_size=2000))
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D #########################
##D #METROPOLIS WITHIN GIBBS#
##D #########################
##D 
##D r <- B2ZM(data = ex2, indep.model = TRUE, 
##D      priorBeta = "unif(0,10)", priorQ="unif(11,17)", 
##D      priorG = "unif(281,482)", tauN.sh = 5 , tauN.sc = 4 , tauF.sh = 5, 
##D      tauF.sc = 7 , VN = pi*10^-3, VF = 3.8, sampler = "MCMC",
##D      mcmc.control = list(NUpd = 10000,  burnin = 1000, lag = 1, 
##D      m = 10000))
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D #######
##D #IMIS#
##D #####
##D 
##D r <- B2ZM(data = ex2, indep.model = TRUE, 
##D      priorBeta = "unif(0,10)", priorQ="unif(11,17)", 
##D      priorG = "unif(281,482)", tauN.sh = 5 , tauN.sc = 4 , tauF.sh = 5, 
##D      tauF.sc = 7 , VN = pi*10^-3, VF = 3.8, sampler = "IMIS",
##D      imis.control = list(N0 = 5000, B = 500, M =  3000,  it.max = 12))
##D 
##D summary(r)
##D plot(r)
##D 
##D 
##D ######
##D #SIR#
##D ####
##D 
##D r <- B2ZM(data = ex2, indep.model = TRUE, 
##D      priorBeta = "unif(0,10)", priorQ="unif(11,17)", 
##D      priorG = "unif(281,482)", tauN.sh = 5 , tauN.sc = 4 , tauF.sh = 5, 
##D      tauF.sc = 7 , VN = pi*10^-3, VF = 3.8, sampler = "SIR",
##D      sir.control = list(m = 10000))
##D 
##D plot(r)
##D summary(r)
## End(Not run)






