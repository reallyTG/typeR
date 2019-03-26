library(mistral)


### Name: S2MART
### Title: Subset by Support vector Margin Algorithm for Reliability
###   esTimation
### Aliases: S2MART

### ** Examples

## Not run: 
##D   res = S2MART(dimension = 2,
##D                lsf = kiureghian,
##D                N1 = 1000, N2 = 5000, N3 = 10000,
##D                plot = TRUE)
##D   
##D   #Compare with crude Monte-Carlo reference value
##D   reference = MonteCarlo(2, kiureghian, N_max = 500000)
## End(Not run)

#See impact of metamodel-based subset simulation with Waarts function :
## Not run: 
##D   res = list()
##D   # SMART stands for the pure metamodel based algorithm targeting directly the
##D   # failure domain. This is not recommended by its authors which for this purpose
##D   # designed S2MART : Subset-SMART
##D   res$SMART = mistral:::SMART(dimension  = 2, lsf = waarts, plot=TRUE)
##D   res$S2MART = S2MART(dimension = 2,
##D                       lsf = waarts,
##D                       N1 = 1000, N2 = 5000, N3 = 10000,
##D                       plot=TRUE)
##D   res$SS = SubsetSimulation(dimension = 2, waarts, n_init_samples = 10000)
##D  res$MC = MonteCarlo(2, waarts, N_max = 500000)
## End(Not run)




