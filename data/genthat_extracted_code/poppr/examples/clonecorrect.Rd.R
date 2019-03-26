library(poppr)


### Name: clonecorrect
### Title: Remove potential bias caused by cloned genotypes in genind or
###   genclone object.
### Aliases: clonecorrect

### ** Examples

# LOAD A. euteiches data set
data(Aeut)

# Redefine it as a genclone object
Aeut <- as.genclone(Aeut)
strata(Aeut) <- other(Aeut)$population_hierarchy[-1]

# Check the number of multilocus genotypes
mlg(Aeut)
popNames(Aeut)

# Clone correct at the population level.
Aeut.pop <- clonecorrect(Aeut, strata =  ~Pop)
mlg(Aeut.pop)
popNames(Aeut.pop)

## Not run: 
##D # Clone correct at the subpopulation level with respect to population and
##D # combine.
##D Aeut.subpop <- clonecorrect(Aeut, strata = ~Pop/Subpop, combine=TRUE)
##D mlg(Aeut.subpop)
##D popNames(Aeut.subpop)
##D 
##D # Do the same, but set to the population level.
##D Aeut.subpop2 <- clonecorrect(Aeut, strata = ~Pop/Subpop, keep=1)
##D mlg(Aeut.subpop2)
##D popNames(Aeut.subpop2)
##D 
##D # LOAD H3N2 dataset
##D data(H3N2)
##D 
##D strata(H3N2) <- other(H3N2)$x
##D 
##D # Extract only the individuals located in China
##D country <- clonecorrect(H3N2, strata =  ~country)
##D 
##D # How many isolates did we have from China before clone correction?
##D sum(strata(H3N2, ~country) == "China") # 155
##D 
##D # How many unique isolates from China after clone correction?
##D sum(strata(country, ~country) == "China") # 79
##D 
##D # Something a little more complicated. (This could take a few minutes on
##D # slower computers)
##D 
##D # setting the hierarchy to be Country > Year > Month  
##D c.y.m <- clonecorrect(H3N2, strata =  ~year/month/country)
##D 
##D # How many isolates in the original data set?
##D nInd(H3N2) # 1903
##D 
##D # How many after we clone corrected for country, year, and month?
##D nInd(c.y.m) # 1190
## End(Not run)



