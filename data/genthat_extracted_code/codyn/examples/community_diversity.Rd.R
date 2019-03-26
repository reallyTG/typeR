library(codyn)


### Name: community_diversity
### Title: Community Diversity
### Aliases: community_diversity

### ** Examples

data(pplots)
#Example with both time and replicates
df <- subset(pplots, plot == 25 | plot == 6)
community_diversity(df,
                    time.var="year", 
                    replicate.var = "plot", 
                    abundance.var = "relative_cover") # for Shannon's diversity metric

df <- subset(pplots, plot == 25 | plot == 6)
community_diversity(df, 
                    time.var="year", 
                    replicate.var = "plot", 
                    abundance.var = "relative_cover", 
                    metric = "InverseSimpson") # for Inverse of Simpson's diversity metric

#Example with no replicates
df <- subset(pplots, plot == 25)
community_diversity(df,
                    time.var="year", 
                    abundance.var = "relative_cover") # for Shannon's diversity metric
                    
#Example with no time or replicate
df <- subset(pplots, plot == 25 & year == 2002)
community_diversity(df,
                    abundance.var = "relative_cover") # for Shannon's diversity metric



