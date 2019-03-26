library(lfl)


### Name: fcut
### Title: Transform data into a set of fuzzy attributes using triangular
###   or raised cosine shapes of the fuzzy sets
### Aliases: fcut fcut.default fcut.numeric fcut.matrix fcut.data.frame
### Keywords: models robust multivariate

### ** Examples

# fcut on non-numeric data
ff <- factor(substring("statistics", 1:10, 1:10), levels = letters)
fcut(ff)

# transform a single vector into a single fuzzy set
x <- runif(10)
fcut(x, breaks=c(0, 0.5, 1), name='age')

# transform single vector into a partition of the interval 0-1
# (the boundary triangles are right-angled)
fcut(x, breaks=c(0, 0, 0.5, 1, 1), name='age')

# also create supersets
fcut(x, breaks=c(0, 0, 0.5, 1, 1), name='age', merge=c(1, 2))

# transform all columns of a data frame
# with different breakpoints
data <- CO2[, c('conc', 'uptake')]
fcut(data, breaks=list(conc=c(95, 95, 350, 1000, 1000),
                       uptake=c(7, 7, 28.3, 46, 46)))



