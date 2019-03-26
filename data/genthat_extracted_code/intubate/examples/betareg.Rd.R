library(intubate)


### Name: betareg
### Title: Interfaces for betareg package for data science pipelines.
### Aliases: ntbt_betamix ntbt_betareg ntbt_betatree
### Keywords: intubate magrittr betareg betamix betatree

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(betareg)
##D 
##D 
##D ## ntbt_betamix: Finite Mixtures of Beta Regression for Rates and Proportions
##D data("ReadingSkills", package = "betareg")
##D 
##D ## Original function to interface
##D set.seed(4040)
##D betamix(accuracy ~ iq, data = ReadingSkills, k = 3, nstart = 10,
##D         extra_components = extraComponent(type = "uniform", coef = 0.99, delta = 0.01))
##D 
##D ## The interface puts data as first parameter
##D set.seed(4040)
##D ntbt_betamix(ReadingSkills, accuracy ~ iq, k = 3, nstart = 10,
##D              extra_components = extraComponent(type = "uniform", coef = 0.99, delta = 0.01))
##D 
##D ## so it can be used easily in a pipeline.
##D ReadingSkills %>%
##D   ntbt_betamix(accuracy ~ iq, k = 3, nstart = 10,
##D                extra_components = extraComponent(type = "uniform", coef = 0.99, delta = 0.01))
##D 
##D 
##D ## ntbt_betareg: Beta Regression for Rates and Proportions
##D data("GasolineYield", package = "betareg")
##D 
##D ## Original function to interface
##D betareg(yield ~ batch + temp, data = GasolineYield)
##D 
##D ## The interface puts data as first parameter
##D ntbt_betareg(GasolineYield, yield ~ batch + temp)
##D 
##D ## so it can be used easily in a pipeline.
##D GasolineYield %>%
##D   ntbt_betareg(yield ~ batch + temp)
##D 
##D 
##D ## ntbt_betatree: Beta Regression Trees
##D data("ReadingSkills", package = "betareg")
##D ReadingSkills$x1 <- rnorm(nrow(ReadingSkills))
##D ReadingSkills$x2 <- runif(nrow(ReadingSkills))
##D ReadingSkills$x3 <- factor(rnorm(nrow(ReadingSkills)) > 0)
##D 
##D library(partykit)
##D ## Original function to interface
##D set.seed(1071)
##D bt <- betatree(accuracy ~ iq | iq, ~ dyslexia + x1 + x2 + x3,
##D                data = ReadingSkills, minsize = 10)
##D plot(bt)
##D 
##D ## The interface puts data as first parameter
##D set.seed(1071)
##D bt <- ntbt_betatree(ReadingSkills, accuracy ~ iq | iq, ~ dyslexia + x1 + x2 + x3,
##D                     minsize = 10)
##D plot(bt)
##D 
##D ## so it can be used easily in a pipeline.
##D set.seed(1071)
##D ReadingSkills %>%
##D   ntbt_betatree(accuracy ~ iq | iq, ~ dyslexia + x1 + x2 + x3, minsize = 10) %>%
##D   plot()
## End(Not run)



