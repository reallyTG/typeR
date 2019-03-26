library(EValue)


### Name: evalues.RD
### Title: Compute E-value for a population-standardized risk difference
###   and its confidence interval limits
### Aliases: evalues.RD

### ** Examples


## example 1     
## Hammond and Holl (1958 JAMA) Data
## Two by Two Table
##          Lung Cancer    No Lung Cancer
##Smoker    397            78557
##Nonsmoker 51             108778

# E-value to shift observed risk difference to 0
evalues.RD( 397, 78557, 51, 108778)

# E-values to shift observed risk difference to other null values
evalues.RD( 397, 78557, 51, 108778, true = 0.001)



