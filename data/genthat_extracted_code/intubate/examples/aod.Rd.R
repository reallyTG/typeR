library(intubate)


### Name: aod
### Title: Interfaces for aod package for data science pipelines.
### Aliases: ntbt_betabin ntbt_donner ntbt_negbin ntbt_quasibin
###   ntbt_quasipois ntbt_raoscott ntbt_splitbin
### Keywords: intubate magrittr aod betabin donner negbin quasibin
###   quasipois raoscott splitbin

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(aod)
##D 
##D 
##D ## ntbt_betabin: beta-binomial generalized linear model accounting
##D ##               for overdispersion in clustered binomial data (n, y)
##D data(orob2)
##D ## Original function to interface
##D betabin(cbind(y, n - y) ~ seed, ~ 1, data = orob2)
##D 
##D ## The interface puts data as first parameter
##D ntbt_betabin(orob2, cbind(y, n - y) ~ seed, ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D orob2 %>%
##D   ntbt_betabin(cbind(y, n - y) ~ seed, ~ 1)
##D 
##D 
##D ## ntbt_donner: Test of Proportion Homogeneity using Donner's Adjustment
##D data(rats)
##D 
##D ## Original function to interface
##D donner(formula = cbind(y, n - y) ~ group, data = rats)
##D 
##D ## The interface puts data as first parameter
##D ntbt_donner(rats, formula = cbind(y, n - y) ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D rats %>%
##D   ntbt_donner(formula = cbind(y, n - y) ~ group)
##D 
##D 
##D ## ntbt_negbin: negative-binomial log linear model accounting
##D ##              for overdispersion in counts y
##D data(salmonella)
##D ## Original function to interface
##D negbin(y ~ log(dose + 10) + dose, ~ 1, salmonella)
##D 
##D ## The interface puts data as first parameter
##D ntbt_negbin(salmonella, y ~ log(dose + 10) + dose, ~ 1)
##D 
##D ## so it can be used easily in a pipeline.
##D salmonella %>%
##D   ntbt_negbin(y ~ log(dose + 10) + dose, ~ 1)
##D 
##D 
##D ## ntbt_quasibin: Quasi-Likelihood Model for Proportions
##D data(orob2) 
##D ## Original function to interface
##D quasibin(cbind(y, n - y) ~ seed * root, data = orob2, phi = 0) 
##D 
##D ## The interface puts data as first parameter
##D ntbt_quasibin(orob2, cbind(y, n - y) ~ seed * root, phi = 0)
##D 
##D ## so it can be used easily in a pipeline.
##D orob2 %>%
##D   ntbt_quasibin(cbind(y, n - y) ~ seed * root, phi = 0)
##D 
##D 
##D ## ntbt_quasipois: Quasi-Likelihood Model for Counts
##D data(salmonella)
##D 
##D ## Original function to interface
##D quasipois(y ~ log(dose + 10) + dose, data = salmonella)
##D 
##D ## The interface puts data as first parameter
##D ntbt_quasipois(salmonella, y ~ log(dose + 10) + dose)
##D 
##D ## so it can be used easily in a pipeline.
##D salmonella %>%
##D   ntbt_quasipois(y ~ log(dose + 10) + dose)
##D 
##D 
##D ## ntbt_raoscott: Test of Proportion Homogeneity using Rao and Scott's Adjustment
##D data(rats)
##D 
##D ## Original function to interface
##D raoscott(cbind(y, n - y) ~ group, data = rats)
##D 
##D ## The interface puts data as first parameter
##D ntbt_raoscott(rats, cbind(y, n - y) ~ group)
##D 
##D ## so it can be used easily in a pipeline.
##D rats %>%
##D   ntbt_raoscott(cbind(y, n - y) ~ group)
##D 
##D 
##D ## ntbt_splitbin: Split Grouped Data Into Individual Data
##D mydata <- data.frame(
##D     success = c(0, 1, 0, 1),
##D     f1 = c("A", "A", "B", "B"),
##D     f2 = c("C", "D", "C", "D"),
##D     n = c(4, 2, 1, 3)
##D     )
##D ## Original function to interface
##D splitbin(formula = n ~ f1 + f2 + success, data = mydata)
##D 
##D ## The interface puts data as first parameter
##D ntbt_splitbin(mydata, formula = n ~ f1 + f2 + success)
##D 
##D ## so it can be used easily in a pipeline.
##D mydata %>%
##D   ntbt_splitbin(formula = n ~ f1 + f2 + success)
## End(Not run)



