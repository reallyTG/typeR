library(intubate)


### Name: intubate-package
### Title: Interface to Popular R Functions for Data Science Pipelines.
### Aliases: intubate-package
### Keywords: intubate magrittr data science

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D 
##D ######### Interface to lm #########
##D ## Original function to interface
##D lm(conc ~ uptake, CO2)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_lm(CO2, conc ~ uptake)
##D 
##D ## so it can be used easily in a pipeline.
##D CO2 %>%
##D   ntbt_lm(conc ~ uptake)
##D 
##D CO2 %>%
##D   ntbt_lm(conc ~ uptake) %>%
##D   summary()
##D 
##D ######### Interface to cor.test #########
##D ## Original function to interface
##D cor.test(~ CONT + INTG, data = USJudgeRatings)
##D 
##D ## The interface reverses the order of data and formula
##D ntbt_cor.test(data = USJudgeRatings, ~ CONT + INTG)
##D 
##D ## so it can be used easily in a pipeline.
##D USJudgeRatings %>%
##D   ntbt_cor.test(~ CONT + INTG)
##D   
##D ######### Interfaces to aggregate and xtabs #########
##D ## Original function to interface
##D ag <- aggregate(len ~ ., data = ToothGrowth, mean)
##D xtabs(len ~ ., data = ag)
##D 
##D ## The interface reverses the order of data and formula
##D ag <- ntbt_aggregate(ToothGrowth, len ~ ., mean)
##D ntbt_xtabs(ag, len ~ .)
##D 
##D ## so it can be used easily in a pipeline.
##D ToothGrowth %>%
##D   ntbt_aggregate(len ~ ., mean) %>%
##D   ntbt_xtabs(len ~ .)
## End(Not run)



