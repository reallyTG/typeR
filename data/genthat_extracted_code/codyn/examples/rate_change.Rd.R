library(codyn)


### Name: rate_change
### Title: Rate of community change over successive time intervals
### Aliases: rate_change

### ** Examples

data(knz_001d)
rate_change(knz_001d[knz_001d$subplot=="A_1",],
                       time.var = "year", 
                       species.var = "species",
                       abundance.var = "abundance") # for one subplot
                       
rate_change(knz_001d, 
             time.var = "year", 
             species.var = "species",
             abundance.var = "abundance",
             replicate.var = "subplot") # across all subplots



