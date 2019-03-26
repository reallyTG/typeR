library(codyn)


### Name: community_structure
### Title: Community Structure
### Aliases: community_structure

### ** Examples

data(pplots)
#Example with both time and replicates
df <- subset(pplots, plot == 25 | plot == 6)
community_structure(df, 
                    time.var="year", 
                    replicate.var = "plot", 
                    abundance.var = "relative_cover") # for Evar evenness metric

df <- subset(pplots, plot == 25 | plot == 6)
community_structure(df,
                    time.var="year", 
                    replicate.var = "plot", 
                    abundance.var = "relative_cover", 
                    metric = "SimpsonEvenness") # for Simpson's evenness metric

#Example with no replicates
df <- subset(pplots, plot == 25)
community_structure(df, 
                    time.var="year", 
                    abundance.var = "relative_cover",
                    metric = "EQ") # for EQ evenness metric

#Example with only a single time point and no replicates
df <- subset(pplots, plot == 25 & year == 2002)
community_structure(df, 
                    abundance.var = "relative_cover") # for Evar evenness metric



