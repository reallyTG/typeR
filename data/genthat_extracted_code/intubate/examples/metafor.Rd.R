library(intubate)


### Name: metafor
### Title: Interfaces for metafor package for data science pipelines.
### Aliases: ntbt_escalc ntbt_rma
### Keywords: intubate magrittr metafor escalc rma

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(metafor)
##D 
##D 
##D ## ntbt_escalc: Calculate Effect Sizes and Outcome Measures
##D data(dat.bcg)
##D dat.long <- to.long(measure = "RR", ai = tpos, bi = tneg, ci = cpos, di = cneg,
##D                     data = dat.bcg, append = FALSE, vlong = TRUE)
##D 
##D ## Original function to interface
##D dat <- escalc(measure="RR", outcome ~ group | study, weights = freq, data = dat.long)
##D rma(yi, vi, data = dat)
##D 
##D ## The interface puts data as first parameter
##D dat <- ntbt_escalc(dat.long, measure="RR", outcome ~ group | study, weights = freq)
##D ntbt_rma(dat, yi, vi)
##D 
##D ## so it can be used easily in a pipeline.
##D dat.long %>%
##D   ntbt_escalc(measure="RR", outcome ~ group | study, weights = freq) %>%
##D   ntbt_rma(yi, vi)
## End(Not run)



