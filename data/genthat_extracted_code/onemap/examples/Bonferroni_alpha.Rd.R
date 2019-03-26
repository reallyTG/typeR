library(onemap)


### Name: Bonferroni_alpha
### Title: Calculates individual significance level to be used to achieve a
###   global alpha (with Bonferroni)
### Aliases: Bonferroni_alpha

### ** Examples

data(mapmaker_example_bc) # Loads a fake backcross dataset installed with onemap
Chi <- test_segregation(mapmaker_example_bc) # Performs the chi-square test for all markers
print(Chi) # Shows the results of the Chi-square tests
Bonferroni_alpha (Chi) # Shows the individual alpha level to be used




