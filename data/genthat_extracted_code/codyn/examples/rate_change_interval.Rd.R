library(codyn)


### Name: rate_change_interval
### Title: Differences in community composition over successive time lag
###   intervals
### Aliases: rate_change_interval

### ** Examples

data(knz_001d)
rate_change_interval(knz_001d[knz_001d$subplot=="A_1",], 
                     time.var = "year", 
                     species.var = "species",
                     abundance.var = "abundance") # for one subplot
                     
                     
rate_change_interval(knz_001d, 
                     time.var = "year", 
                     species.var = "species",
                     abundance.var = "abundance",
                      replicate.var = "subplot") # across all subplots



