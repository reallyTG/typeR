library(intubate)


### Name: flexmix
### Title: Interfaces for flexmix package for data science pipelines.
### Aliases: ntbt_flexmix ntbt_initFlexmix ntbt_stepFlexmix
### Keywords: intubate magrittr flexmix initFlexmix stepFlexmix

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(flexmix)
##D 
##D 
##D ## ntbt_flexmix: Flexible Mixture Modeling
##D data("NPreg", package = "flexmix")
##D 
##D ## Original function to interface
##D set.seed(1)
##D ex1 <- flexmix(yn ~ x + I(x^2), data = NPreg, k = 2,
##D                control = list(verb = 5, iter = 100))
##D plot(ex1)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1)
##D ex1 <- ntbt_flexmix(NPreg, yn ~ x + I(x^2), k = 2,
##D                     control = list(verb = 5, iter = 100))
##D plot(ex1)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1)
##D NPreg %>%
##D   ntbt_flexmix(yn ~ x + I(x^2), k = 2,
##D                control = list(verb = 5, iter = 100)) %>%
##D   plot()
##D 
##D ## NOTE: it seems we could also add initFlexmix and stepFlexmix,
##D ##       that call flexmix repeteadly. I will not include examples
##D ##       for those for now.
## End(Not run)



