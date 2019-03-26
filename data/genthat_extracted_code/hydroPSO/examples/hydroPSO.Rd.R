library(hydroPSO)


### Name: hydroPSO
### Title: Enhanced Particle Swarm Optimisation algorithm
### Aliases: hydroPSO
### Keywords: optimize files

### ** Examples

# Number of dimensions of the optimisation problem (for all the examples)
D <- 5

# Boundaries of the search space (Rastrigin function)
lower <- rep(-5.12, D)
upper <- rep(5.12, D)

## Not run: 
##D # Setting the home directory of the user as working directory 
##D setwd("~")
##D    
##D ################################ 
##D # Example 1. Basic use         #
##D ################################ 
##D 
##D # Setting the seed (for reproducible results)         
##D set.seed(100)
##D 
##D # Basic use 1. Rastrigin function (non-linear and multi-modal with many local minima)
##D # Results are not saved to the hard disk, for faster execution ('write2disk=FALSE')
##D hydroPSO(fn=rastrigin, lower=lower, upper=upper, control=list(write2disk=FALSE) )
##D 
##D # Basic use 2. Rastrigin function (non-linear and multimodal with many local minima)
##D # Results are saved to the hard disk. Slower than before but results are kept for
##D # future inspection
##D hydroPSO(fn=rastrigin, lower=lower, upper=upper )
##D 
##D # Plotting the results, by default into the active graphic device
##D # 'MinMax="min"' indicates a minimisation problem
##D plot_results(MinMax="min") 
##D 
##D # Plotting the results into PNG files. 
##D plot_results(MinMax="min", do.png=TRUE)         
##D 
##D 
##D ################################ 
##D # Example 2. More advanced use #
##D ################################ 
##D 
##D # Defining the relative tolerance ('reltol'), the frequency of report messages 
##D # printed to the screen ('REPORT'), and no output files ('write2disk')
##D set.seed(100)
##D hydroPSO( fn=rastrigin, lower=lower, upper=upper,        
##D           control=list(reltol=1e-20, REPORT=10, write2disk=FALSE) )
##D         
##D         
##D ################################### 
##D # Example 3. von Neumman Topology #
##D ###################################
##D 
##D # Same as Example 2, but using a von Neumann topology ('topology="vonNeumann"')
##D set.seed(100)
##D hydroPSO(fn=rastrigin,lower=lower,upper=upper,
##D          control=list(topology="vonNeumann", reltol=1E-20, 
##D                       REPORT=50, write2disk=FALSE) ) 
##D 
##D 
##D 
##D ################################ 
##D # Example 4. Regrouping        #
##D ################################ 
##D 
##D # Same as Example 3 ('topology="vonNeumann"') but using regrouping ('use.RG')
##D set.seed(100)
##D hydroPSO(fn=rastrigin,lower=lower,upper=upper,
##D          control=list(topology="vonNeumann", reltol=1E-20, 
##D                       REPORT=50, write2disk=FALSE,
##D                       use.RG=TRUE,RG.thr=7e-2,RG.r=3,RG.miniter=50) )
##D 
##D 
##D ################################ 
##D # Example 5. FIPS              #
##D ################################ 
##D 
##D # Same as Example 3 ('topology="vonNeumann"') but using a fully informed 
##D # particle swarm (FIPS) variant ('method') with global best topology
##D set.seed(100)
##D hydroPSO(fn=rastrigin,lower=lower,upper=upper, method="fips",
##D          control=list(topology="gbest",reltol=1E-9,write2disk=FALSE) )
##D 
##D 
##D ################################ 
##D # Example 6. normalisation     #
##D ################################ 
##D 
##D # Same as Example 3 but parameter values are normalised to the [0,1] interval 
##D # during the optimisation. This option is recommended when the search space is 
##D # not an hypercube (not useful is this particular example)
##D set.seed(100)
##D hydroPSO(fn=rastrigin,lower=lower,upper=upper,
##D          control=list(topology="vonNeumann", reltol=1E-20, normalise=TRUE,
##D                       REPORT=50, write2disk=FALSE) ) 
##D 
##D 
##D ################################ 
##D # Example 7. Asynchronus update#
##D ################################ 
##D 
##D # Same as Example 3, but using asynchronus update of previus and local best 
##D # ('best.update'). Same global optimum but much slower....
##D set.seed(100)
##D hydroPSO(fn=rastrigin,lower=lower,upper=upper,
##D          control=list(topology="vonNeumann", reltol=1E-20, 
##D                       REPORT=50, write2disk=FALSE, best.update="async") ) 
##D 
## End(Not run) # dontrun END




