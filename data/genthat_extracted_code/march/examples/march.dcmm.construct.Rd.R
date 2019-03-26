library(march)


### Name: march.dcmm.construct
### Title: Construct a double chain Markov model (DCMM).
### Aliases: march.dcmm.construct

### ** Examples

# Construct a 2 hidden states DCMM for the pewee data
# with hidden order set to 2 and visible order set to 1.
# The estimation procedure uses both the evolutionary algorithm (population size 2, 
# one iteration) and the Bauw-Welch algorithm (one iteration).
march.dcmm.construct(y=pewee,orderHC=2,orderVC=1,M=2,popSize=2,gen=1,iterBw=1,stopBw=0.0001)

## Not run: 
##D  
##D # Same as above, but the DCMM is replaced by a HMM (the visible order OrderVC is set to zero).
##D march.dcmm.construct(y=pewee,orderHC=2,orderVC=0,M=2,popSize=2,gen=1,iterBw=1,stopBw=0.0001)  
##D   
##D # Construct a DCMM using an order 2 hidden chain,
##D # a visible chain of order 3 and 3 hidden states.
##D # A first model is computed using both EA and Baum-Welch algorithms.
##D # Then the initial solution is improved through two rounds of Baum-Welch optimization.
##D models <- list()
##D models[[length(models)+1]] <- march.dcmm.construct(y=pewee,orderHC=2,
##D                                                    orderVC=3,M=3,popSize=2,gen=2)
##D models[[length(models)+1]] <- march.dcmm.construct(y=pewee,seedModel=models[[1]],
##D                                                    orderVC=3,iterBw=10,stopBw=0.001)
##D models[[length(models)+1]] <- march.dcmm.construct(y=pewee,seedModel=models[[2]],
##D                                                    orderVC=3,iterBw=10,stopBw=0.0001)
##D # Show performance indicators (ll, number of independent parameters,
##D # BIC and AIC) for all computed models.
##D r <- do.call(rbind,lapply(models,march.summary))
##D print(r)
##D 
##D # Construct a three hidden states, first-order HMM (hence OrderVC=0) for the sleep data.
##D # By setting gen=1 and popSize=1, the estimation procedure uses only the Baum-Welch algorithm.
##D HMM <- march.dcmm.construct(sleep,orderHC=1,orderVC=0,M=3,gen=1,popSize=1,iterBw=10,stopBw=0.0001)
##D print(HMM)
##D # Compute the best sequence of hidden states for each subject in the sleep data.
##D HS <- march.dcmm.viterbi(HMM,sleep)
##D # Display the hidden states for the first 10 subjects.
##D print(HS[1:10])
##D 
## End(Not run)



