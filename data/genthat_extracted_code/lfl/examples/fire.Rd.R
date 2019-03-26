library(lfl)


### Name: fire
### Title: Compute truth-degrees of rules on data
### Aliases: fire
### Keywords: models robust multivariate

### ** Examples

# fire whole rules on a vector
x <- 1:10 / 10
names(x) <- letters[1:10]
rules <- list(c('a', 'c', 'e'),
              c('b'),
              c('d', 'a'),
              c('c', 'a', 'b'))
fire(x, rules, tnorm='goguen')

# fire antecedents of the rules on a matrix
x <- matrix(1:20 / 20, nrow=2)
colnames(x) <- letters[1:10]
rules <- list(c('a', 'c', 'e'),
              c('b'),
              c('d', 'a'),
              c('c', 'a', 'b'))
fire(x, rules, tnorm='goedel', onlyAnte=TRUE)

# the former command should be equal to
fire(x, antecedents(rules), tnorm='goedel')



