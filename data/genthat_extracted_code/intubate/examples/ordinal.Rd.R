library(intubate)


### Name: ordinal
### Title: Interfaces for ordinal package for data science pipelines.
### Aliases: ntbt_clm ntbt_clm2 ntbt_clmm
### Keywords: intubate magrittr ordinal clm clm2 clmm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(ordinal)
##D 
##D 
##D ## ntbt_clm: Cumulative Link Models
##D ## ntbt_clm2:
##D ## Original function to interface
##D clm(rating ~ temp * contact, data = wine)
##D clm2(rating ~ temp * contact, data = wine)
##D 
##D ## The interface puts data as first parameter
##D ntbt_clm(wine, rating ~ temp * contact)
##D ntbt_clm2(wine, rating ~ temp * contact)
##D 
##D ## so it can be used easily in a pipeline.
##D wine %>%
##D   ntbt_clm(rating ~ temp * contact)
##D wine %>%
##D   ntbt_clm2(rating ~ temp * contact)
##D 
##D 
##D ## ntbt_clmm: Cumulative Link Mixed Models
##D ## Original function to interface
##D clmm(SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD), data = soup,
##D      link = "probit", threshold = "equidistant")
##D 
##D ## The interface puts data as first parameter
##D ntbt_clmm(soup, SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD),
##D           link = "probit", threshold = "equidistant")
##D 
##D ## so it can be used easily in a pipeline.
##D soup %>%
##D   ntbt_clmm(SURENESS ~ PROD + (1|RESP) + (1|RESP:PROD),
##D             link = "probit", threshold = "equidistant")
## End(Not run)



