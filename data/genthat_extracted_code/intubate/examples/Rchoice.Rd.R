library(intubate)


### Name: Rchoice
### Title: Interfaces for Rchoice package for data science pipelines.
### Aliases: ntbt_Rchoice
### Keywords: intubate magrittr Rchoice

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(Rchoice)
##D 
##D ## ntbt_Rchoice: Bias reduction in Binomial-response GLMs
##D data("Workmroz")
##D 
##D ## Original function to interface
##D Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,
##D         data = Workmroz, family = binomial('probit'))
##D ## The interface puts data as first parameter
##D ntbt_Rchoice(Workmroz, lfp ~ k5 + k618 + age + wc + hc + lwg + inc,
##D              family = binomial('probit'))
##D 
##D ## so it can be used easily in a pipeline.
##D Workmroz %>%
##D   ntbt_Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,
##D                family = binomial('probit'))
## End(Not run)



