library(EcoGenetics)


### Name: eco.post.geneland
### Title: Log posterior probability plot for Geneland repetitions with
###   fixed K
### Aliases: eco.post.geneland

### ** Examples

## Not run: 
##D require("Geneland")
##D data(eco.test)
##D 
##D # We create a folder in the working directory for the results and 
##D # save the data frames of the object "eco" in the format required
##D # by Geneland:
##D 
##D path.1 <- getwd()
##D path <- paste(path.1,"/test/", sep="")
##D dir.create(path) 
##D setwd(path)
##D ecogen2geneland(eco, ploidy = 2)
##D 
##D # Auxiliar function for running some repetitions with fixed K = 4.
##D # Each repetition is saved in the folder "test":
##D simul <- function(i) {
##D  path <- getwd()
##D path <- paste(path,"/",i, sep = "")
##D dir.create(path) 
##D MCMC(coordinates = read.table("XY.txt"), 
##D 		 geno.dip.codom = read.table("G.txt"), 
##D 		 varnpop = TRUE, npopmin = 4, npopmax = 4, spatial = TRUE, 
##D 		 freq.model = "Correlated", nit = 500, thinning = 10,
##D 		 path.mcmc = path)
##D }
##D 
##D # 5 repetitions with K = 4 
##D lapply(1:5, simul)
##D 
##D # Check that in the folder "test" are the simulated result.
##D # Your results must have that appearance.
##D 
##D # Plot of the repetition order number vs the corresponding
##D # posterior probability, with a burn-in of 10 mcmc:
##D eco.post.geneland(5, 10)
## End(Not run)




