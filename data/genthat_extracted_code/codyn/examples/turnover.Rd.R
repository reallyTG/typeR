library(codyn)


### Name: turnover
### Title: Species Turnover
### Aliases: turnover

### ** Examples

 data(knz_001d)

 # Calculate relative total turnover within replicates
 total.res <- turnover(df=knz_001d,  
               time.var = "year", 
               species.var = "species",
               abundance.var = "abundance", 
               replicate.var="subplot")
 
 # Calculate relative species appearances within replicates
 appear.res <- turnover(df=knz_001d, 
               time.var = "year", 
               species.var = "species",
               abundance.var = "abundance",  
               replicate.var="subplot", 
               metric="appearance")
 
 # Calculate relative species disappearances within replicates
 disappear.res <- turnover(df=knz_001d, 
               time.var = "year", 
               species.var = "species",
               abundance.var = "abundance", 
               replicate.var="subplot", 
               metric="disappearance")
 



