library(mistral)


### Name: SubsetSimulation
### Title: Subset Simulation Monte Carlo
### Aliases: SubsetSimulation ss subset

### ** Examples

#Try Subset Simulation Monte Carlo on a given function and change number of points.
 
## Not run: 
##D  res = list()
##D  res[[1]] = SubsetSimulation(2,kiureghian,N=10000)
##D  res[[2]] = SubsetSimulation(2,kiureghian,N=100000)
##D  res[[3]] = SubsetSimulation(2,kiureghian,N=500000)
## End(Not run)

# Compare SubsetSimulation with MP
## Not run: 
##D p <- res[[3]]$p # get a reference value for p
##D p_0 <- 0.1 # the default value recommended by Au \& Beck
##D N_mp <- 100
##D # to get approxumately the same number of calls to the lsf
##D N_ss <- ceiling(N_mp*log(p)/log(p_0))
##D comp <- replicate(50, {
##D ss <- SubsetSimulation(2, kiureghian, N = N_ss)
##D mp <- MP(2, kiureghian, N = N_mp, q = 0)
##D comp <- c(ss$p, mp$p, ss$Ncall, mp$Ncall)
##D names(comp) = rep(c("SS", "MP"), 2)
##D comp
##D })
##D boxplot(t(comp[1:2,])) # check accuracy
##D sd.comp <- apply(comp,1,sd)
##D print(sd.comp[1]/sd.comp[2]) # variance increase in SubsetSimulation compared to MP
##D 
##D colMeans(t(comp[3:4,])) # check similar number of calls
## End(Not run)




