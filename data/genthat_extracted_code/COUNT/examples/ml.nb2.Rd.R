library(COUNT)


### Name: ml.nb2
### Title: NB2: maximum likelihood linear negative binomial regression
### Aliases: ml.nb2
### Keywords: models

### ** Examples

# Table 8.7, Hilbe. J.M. (2011), Negative Binomial Regression, 
#   2nd ed. Cambridge University Press (adapted)
data(medpar)
medpar$type <- factor(medpar$type)
med.nb2 <- ml.nb2(los ~ hmo + white + type, data = medpar)
med.nb2



