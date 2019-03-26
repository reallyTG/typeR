library(codyn)


### Name: multivariate_difference
### Title: Using dissimilarity-based metrics to calculate differences in
###   composition and dispersion between pairs of treatments at a single
###   time point
### Aliases: multivariate_difference

### ** Examples

 
data(pplots)
# Without time
df <- subset(pplots, year == 2002)
multivariate_difference(df, 
                        replicate.var = "plot", 
                        treatment.var = "treatment", 
                        species.var = "species", 
                        abundance.var = "relative_cover")
# There are 6 replicates for each of three treatments, thus 18 total
# observations.

# Without time and with reference treatment
df <- subset(pplots, year == 2002)
multivariate_difference(df, 
                        replicate.var = "plot", 
                        treatment.var = "treatment", 
                        species.var = "species", 
                        abundance.var = "relative_cover",
                        reference.treatment = "N1P0")
# There are 6 replicates for each of three treatments, thus 18 total
# observations.

# With time
multivariate_difference(pplots, 
                        time.var = "year", 
                        replicate.var = "plot", 
                        species.var = "species", 
                        abundance.var = "relative_cover", 
                        treatment.var = "treatment")
# In each year there are 6 replicates for each of three treatments, for a
# total of 18 observations.



