library(sbl)


### Name: sblgwas
### Title: Sparse Bayesian Learning for QTL Mapping and Genome-Wide
###   Association Studies
### Aliases: sblgwas

### ** Examples

# Load example data from sbl package
data(gen)
data(phe)
data(intercept)

# Run sblgwas() to perform association study of example data
# setting t = 0 leads to the most sparse model
fit<-sblgwas(x=intercept, y=phe, z=gen, t=0)
my.blup<-fit$blup

# setting t = -2 leads to the least sparse model
fit<-sblgwas(x=intercept, y=phe, z=gen, t=-2)
my.blup<-fit$blup



