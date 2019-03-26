library(represent)


### Name: jrparams
### Title: Assess similarity of two multidimensional data sets
### Aliases: jrparams

### ** Examples

#Load example data sets, 50 observations x 5 variables
data(DATASET.1)
data(DATASET.2)

#Assess representativity using all principal components
#(default; will be fine if both sets are of equal rank)
jrparams(DATASET.1, DATASET.2)

#Positive control: check similarity of DATASET.1 with itself
#(values for all parameters should be unity)
jrparams(DATASET.1, DATASET.1)



