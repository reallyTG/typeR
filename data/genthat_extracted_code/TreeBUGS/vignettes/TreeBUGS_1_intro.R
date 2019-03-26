## ---- eval=F-------------------------------------------------------------
#  readEQN(file = "pathToFile.eqn",       # relative or absolute path
#          restrictions = list("Dn=Do"),  # equality constraints
#          paramOrder = TRUE)             # show parameter order

## ---- eval=FALSE---------------------------------------------------------
#  restrictions = list("Dn=Do", "g=0.5")

## ---- eval=FALSE---------------------------------------------------------
#  # load the package:
#  library(TreeBUGS)
#  
#  # fit the model:
#  fitHierarchicalMPT <- betaMPT(
#        eqnfile="2htm.txt",         # .eqn file
#        data="data_ind.csv",        # individual data
#        restrictions=list("Dn=Do"), # parameter restrictions (or path to file)
#  
#        ### optional MCMC input:
#        n.iter = 20000,             # number of iterations
#        n.burnin = 5000,            # number of burnin samples that are removed
#        n.thin = 5,                 # thinning rate of removing samples
#        n.chains = 3                # number of MCMC chains (run in parallel)
#  )

## ---- eval=FALSE---------------------------------------------------------
#  # Default: Traceplot and density
#  plot(fitHierarchicalMPT,    # fitted model
#       parameter ="mean"      # which parameter to plot
#  )
#  # further arguments are passed to ?plot.mcmc.list
#  
#  # Auto-correlation plots:
#  plot(fitHierarchicalMPT,  parameter = "mean", type = "acf")
#  
#  # Gelman-Rubin plots:
#  plot(fitHierarchicalMPT,  parameter = "mean", type = "gelman")

## ---- eval=FALSE---------------------------------------------------------
#  summary(fitHierarchicalMPT)

## ---- eval=FALSE---------------------------------------------------------
#  plotParam(fitHierarchicalMPT,     # estimated parameters
#            includeIndividual=TRUE  # whether to plot individual estimates
#  )
#  plotDistribution(fitHierarchicalMPT)      # estimated hierarchical parameter distribution
#  plotFit(fitHierarchicalMPT)               # observed vs. predicted mean frequencies
#  plotFit(fitHierarchicalMPT, stat = "cov") # observed vs. predicted covariance
#  plotFreq(fitHierarchicalMPT)              # individual and mean raw frequencies per tree
#  plotPriorPost(fitHierarchicalMPT)         # comparison of prior/posterior (group level parameters)

## ---- eval=FALSE---------------------------------------------------------
#  # matrix for further use within R:
#  tt <- getParam(fitHierarchicalMPT, parameter="theta",
#                 stat="mean")
#  tt
#  
#  # save complete summary of individual estimates to file:
#  getParam(fitHierarchicalMPT, parameter = "theta",
#           stat = "summary", file = "parameter.csv")

