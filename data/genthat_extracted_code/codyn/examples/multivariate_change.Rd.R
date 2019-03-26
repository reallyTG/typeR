library(codyn)


### Name: multivariate_change
### Title: Using dissimilarity-based metrics to calculate changes in
###   composition and dispersion
### Aliases: multivariate_change

### ** Examples

data(pplots)
# With treatment
multivariate_change(pplots,
                    time.var="year", 
                    replicate.var = "plot", 
                    treatment.var = "treatment", 
                    species.var = "species", 
                    abundance.var = "relative_cover")
# In each year there are 6 replicates and there are 4 years of data for 3
# time comparisons, thus 24 total observations in each treatment.

# With treatment and reference year
multivariate_change(pplots,
                    time.var="year", 
                    replicate.var = "plot", 
                    treatment.var = "treatment", 
                    species.var = "species", 
                    abundance.var = "relative_cover",
                    reference.time = 2002)
# In each year there are 6 replicates and there are 4 years of data for 3
# time comparisons, thus 24 total observations in each treatment.

# Without treatment
df <- subset(pplots, treatment == "N1P0")
multivariate_change(df, 
                    time.var="year", 
                    replicate.var = "plot", 
                    species.var = "species", 
                    abundance.var = "relative_cover")
# In each year there are 6 replicates and there are 4 years of data for 3
# time comparisons, thus 24 total observations.




