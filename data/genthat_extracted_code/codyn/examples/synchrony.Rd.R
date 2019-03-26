library(codyn)


### Name: synchrony
### Title: Species synchrony
### Aliases: synchrony

### ** Examples

data(knz_001d)
synchrony(knz_001d[knz_001d$subplot=="A_1",],
                     time.var = "year", 
                     species.var = "species",
                     abundance.var = "abundance") # for one subplot
## Not run: 
##D synchrony(knz_001d, 
##D              time.var = "year", 
##D              species.var = "species",
##D              abundance.var = "abundance",
##D              replicate.var = "subplot") # across all subplots
##D              
##D synchrony(knz_001d,  
##D              time.var = "year", 
##D              species.var = "species",
##D              abundance.var = "abundance",
##D              replicate.var = "subplot", 
##D              metric="Gross") # With Gross et al. (2014) metric.
## End(Not run)



