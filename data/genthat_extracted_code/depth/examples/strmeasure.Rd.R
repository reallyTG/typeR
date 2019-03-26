library(depth)


### Name: strmeasure
### Title: Computing trimmed measures of sherical location
### Aliases: strmeasure
### Keywords: multivariate nonparametric robust directional

### ** Examples
## calculation of trimmed mean direction
set.seed(2011)
strmeasure(runif(30,min=0,max=2*pi),alpha=1/3,method="Mean")

## calculating of trimmed Tukey median
set.seed(2011)
strmeasure(runif(30,min=0,max=2*pi),alpha=1/3,method="Tukey")


