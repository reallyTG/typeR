library(intubate)


### Name: gam
### Title: Interfaces for gam package for data science pipelines.
### Aliases: ntbt_gam
### Keywords: intubate magrittr gam

### ** Examples

## Not run: 
##D library(intubate)
##D library(gam)
##D data(kyphosis)
##D 
##D ## Original function to interface
##D fit <- gam(Kyphosis ~ s(Age,4) + Number, family = binomial, data = kyphosis,
##D     trace = TRUE)
##D summary(fit)
##D fit <- gam(Kyphosis ~ poly(Age,2) + s(Start), data = kyphosis,
##D            family = binomial, subset = Number > 2)
##D summary(fit)
##D fit <- gam(Ozone^(1/3) ~ lo(Solar.R) + lo(Wind, Temp),
##D            data = airquality, na = na.gam.replace)
##D summary(fit)
##D 
##D ## The interface reverses the order of data and formula
##D fit <- ntbt_gam(kyphosis, Kyphosis ~ s(Age,4) + Number,
##D                 family = binomial, trace = TRUE)
##D summary(fit)
##D fit <- ntbt_gam(data = kyphosis, Kyphosis ~ poly(Age,2) + s(Start),
##D                 family = binomial, subset = Number > 2)
##D summary(fit)
##D fit <- ntbt_gam(data = airquality, Ozone^(1/3) ~ lo(Solar.R) + lo(Wind, Temp),
##D                 na = na.gam.replace)
##D summary(fit)
##D 
##D ## so it can be used easily in a pipeline.
##D library(magrittr)
##D kyphosis %>%
##D   ntbt_gam(Kyphosis ~ s(Age,4) + Number,
##D           family = binomial, trace = TRUE) %>%
##D   summary()
##D 
##D kyphosis %>%
##D   ntbt_gam(Kyphosis ~ poly(Age,2) + s(Start),
##D            family = binomial, subset = Number > 2) %>%
##D   summary()
##D   
##D airquality %>%
##D   ntbt_gam(Ozone^(1/3) ~ lo(Solar.R) + lo(Wind, Temp),
##D            na = na.gam.replace) %>%
##D   summary()
## End(Not run)



