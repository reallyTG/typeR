library(COUNT)


### Name: ml.pois
### Title: NB2: maximum likelihood Poisson regression
### Aliases: ml.pois
### Keywords: models

### ** Examples

# Table 8.7, Hilbe. J.M. (2011), Negative Binomial Regression, 
#   2nd ed. Cambridge University Press (adapted)
data(medpar)
medpar$type <- factor(medpar$type)
med.pois <- ml.pois(los ~ hmo + white + type, data = medpar)
med.pois

data(rwm5yr)
lyear <- log(rwm5yr$year)
rwm.poi <- ml.pois(docvis ~ outwork + age + female, offset=lyear, data =
rwm5yr)
rwm.poi
exp(rwm.poi$Estimate)
exp(rwm.poi$LCL)
exp(rwm.poi$UCL)




