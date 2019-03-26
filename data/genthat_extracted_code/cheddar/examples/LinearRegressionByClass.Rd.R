library(cheddar)


### Name: LinearRegressionByClass
### Title: Linear regression by class
### Aliases: LinearRegressionByClass
### Keywords: utilities

### ** Examples

data(TL84)

# Regressions fitted to log10(Biomass) versus log10(M) data.
models <- LinearRegressionByClass(TL84, 'Log10M', 'Log10Biomass', 
                                  'category')

# 'all', 'producer', 'invertebrate', 'vert.ecto'
names(models)

# Extract slopes and intercepts
sapply(models, coef)



