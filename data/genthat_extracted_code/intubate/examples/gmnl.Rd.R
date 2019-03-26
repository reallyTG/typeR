library(intubate)


### Name: gmnl
### Title: Interfaces for gmnl package for data science pipelines.
### Aliases: ntbt_gmnl
### Keywords: intubate magrittr gmnl

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(gmnl)
##D 
##D 
##D ## ntbt_gmnl: Estimate Multinomial Logit Models with Observed and
##D ##             Unobserved Individual Heterogeneity
##D data("TravelMode", package = "AER")
##D library(mlogit)
##D TM <- mlogit.data(TravelMode, choice = "choice", shape = "long", 
##D                  alt.levels = c("air", "train", "bus", "car"), chid.var = "individual")
##D 
##D ## Original function to interface
##D gmnl(choice ~ wait + vcost + travel + gcost| 1, data = TM,
##D      model = "smnl", R = 100,
##D      notscale = c(1, 1, 1, rep(0, 4)))
##D 
##D ## The interface puts data as first parameter
##D ntbt_gmnl(TM, choice ~ wait + vcost + travel + gcost| 1,
##D           model = "smnl", R = 100, 
##D           notscale = c(1, 1, 1, rep(0, 4)))
##D 
##D ## so it can be used easily in a pipeline.
##D TM %>%
##D   ntbt_gmnl(choice ~ wait + vcost + travel + gcost| 1,
##D             model = "smnl", R = 100, 
##D             notscale = c(1, 1, 1, rep(0, 4)))
## End(Not run)



