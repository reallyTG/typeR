library(lfl)


### Name: lcut
### Title: Transform data into a set of linguistic fuzzy attributes
### Aliases: lcut lcut3 lcut3.default lcut3.numeric lcut3.matrix
###   lcut3.data.frame lcut5 lcut5.default lcut5.numeric lcut5.matrix
###   lcut5.data.frame
### Keywords: models robust multivariate

### ** Examples

# transform a single vector
x <- runif(10)
lcut3(x, name='age')
lcut5(x, name='age')


# transform single vector with custom context
lcut3(x, context=c(0, 0.2, 0.5), name='age')
lcut5(x, context=c(0, 0.2, 0.5), name='age')


# transform all columns of a data frame
# and do not use any hedges
data <- CO2[, c('conc', 'uptake')]
lcut3(data, hedges=NULL)
lcut5(data, hedges=NULL)


# definition of custom contexts for different columns 
# of a data frame while selecting only "ve" and "ro" hedges.
lcut3(data,
     context=list(conc=c(0, 500, 1000),
                  uptake=c(0, 25, 50)),
     hedges=c('ve', 'ro'))


# lcut on non-numeric data is the same as fcut()
ff <- factor(substring("statistics", 1:10, 1:10), levels = letters)
lcut3(ff)
lcut5(ff)



