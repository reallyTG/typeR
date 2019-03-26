library(COUNT)


### Name: ml.nb1
### Title: NB1: maximum likelihood linear negative binomial regression
### Aliases: ml.nb1
### Keywords: models

### ** Examples

# Table 10.8, Hilbe. J.M. (2011), Negative Binomial Regression, 
#   2nd ed. Cambridge University Press (adapted)
data(medpar)
medpar$type <- factor(medpar$type)
med.nb1 <- ml.nb1(los ~ hmo + white + type, data = medpar)
med.nb1



