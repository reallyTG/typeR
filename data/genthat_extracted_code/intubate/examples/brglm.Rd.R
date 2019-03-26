library(intubate)


### Name: brglm
### Title: Interfaces for brglm package for data science pipelines.
### Aliases: ntbt_brglm
### Keywords: intubate magrittr brglm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(brglm)
##D 
##D ## ntbt_brglm: Bias reduction in Binomial-response GLMs
##D data(lizards)
##D 
##D ## Original function to interface
##D brglm(cbind(grahami, opalinus) ~ height + diameter +
##D         light + time, family = binomial(logit), data = lizards,
##D       method = "brglm.fit")
##D ## The interface puts data as first parameter
##D ntbt_brglm(lizards, cbind(grahami, opalinus) ~ height + diameter +
##D              light + time, family = binomial(logit),
##D            method = "brglm.fit")
##D 
##D ## so it can be used easily in a pipeline.
##D lizards %>%
##D   ntbt_brglm(cbind(grahami, opalinus) ~ height + diameter +
##D                light + time, family = binomial(logit),
##D              method = "brglm.fit")
## End(Not run)



