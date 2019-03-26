library(poppr)


### Name: rraf
### Title: Round Robin Allele Frequencies
### Aliases: rraf

### ** Examples


data(Pram)

# Round robin allele frequencies, correcting zero-valued frequencies to 1/nInd(Pram)
rraf(Pram)


## Not run: 
##D 
##D ## Round robin allele frequencies will be different than observed
##D 
##D # Compare to without round robin:
##D PrLoc <- seploc(Pram, res = "mat") # get locus by matrix
##D lapply(PrLoc, colMeans, na.rm = TRUE)
##D 
##D # Without round robin, clone corrected:
##D Pcc    <- clonecorrect(Pram, strata = NA) # indiscriminantly clone correct
##D PccLoc <- seploc(Pcc, res = "mat")
##D lapply(PccLoc, colMeans, na.rm = TRUE)
##D 
##D ## Different methods of obtaining round robin allele frequencies
##D 
##D # Get vector output.
##D rraf(Pram, res = "vector")
##D 
##D # Getting the output as a data frame allows us to use ggplot2 to visualize
##D (Prdf <- rraf(Pram, res = "data.frame"))
##D library("ggplot2")
##D ggplot(Prdf, aes(y = allele, x = frequency)) +
##D   geom_point() +
##D   facet_grid(locus ~ ., scale = "free_y", space = "free")
##D 
##D ## Round Robin allele frequencies by population (matrix only)
##D 
##D # By default, allele frequencies will be corrected by 1/n per population
##D (Prbp <- rraf(Pram, by_pop = TRUE))
##D 
##D # This might be problematic because populations like PistolRSF_OR has a 
##D # population size of four.
##D 
##D # By using the 'e' argument to rare_allele_correction, this can be set to a
##D # more reasonable value.
##D (Prbp <- rraf(Pram, by_pop = TRUE, e = 1/nInd(Pram)))
##D 
##D 
##D 
## End(Not run)



