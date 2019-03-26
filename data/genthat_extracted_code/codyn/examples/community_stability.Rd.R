library(codyn)


### Name: community_stability
### Title: Community Stability
### Aliases: community_stability

### ** Examples

data(knz_001d)
community_stability(knz_001d[knz_001d$subplot=="A_1",], 
                     time.var = "year", 
                     abundance.var = "abundance") # for one subplot
community_stability(knz_001d,
                     time.var = "year", 
                     abundance.var = "abundance",
                     replicate.var = "subplot") # across all subplots



