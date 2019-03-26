library(dfpk)


### Name: nsim
### Title: Simulate a single or n prospective clinical trial(s) using the
###   PK measure in the dose finding designs.
### Aliases: nsim

### ** Examples

    ## Not run: 
##D         TR = 10                                 # Total number of simulations                 
##D         N = 30                         
##D         limitTox <- 10.96 
##D         PKparameters <- c(2, 10, 100)             # PK parameters ka,CL,V
##D         omegaIIV <- 0.7                        
##D         omegaAlpha <- 0
##D         doses <- c(12.59972, 34.65492, 44.69007, 60.80685, 83.68946, 100.37111)     
##D         timeSampling <- seq(0, 24, length.out=48)    
##D         sigma <- rep(0.2, length(timeSampling))         
##D 
##D         gen.scen <- sim.data(PKparameters,omegaIIV,omegaAlpha,sigma,doses,
##D                              limitTox,timeSampling, N, TR)
##D 
##D         cohort = 1
##D         simulatedData <- gen.scen  
##D         icon <- c(2:6, round(seq(9, 48, ((48-9)/4))))      
##D         theta <- 0.2                           
##D 
##D         ##############################################
##D         ############### Select a model ###############
##D         ##############################################
##D 
##D         model = "pktox"
##D 
##D         ############################################
##D         ############ Run the simulation(s) #########
##D         ############################################
##D         
##D         results_sim <- nsim(doses, N, cohort, icon, theta, model, simulatedData, TR, 
##D                             AUCmethod = 1)
##D         results_sim 
##D     
## End(Not run)



