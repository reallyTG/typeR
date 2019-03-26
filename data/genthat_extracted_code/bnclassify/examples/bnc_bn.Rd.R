library(bnclassify)


### Name: bnc_bn
### Title: Bayesian network classifier with structure and parameters.
### Aliases: bnc_bn

### ** Examples

data(car)
tan <- bnc('tan_cl', 'class', car, smooth = 1)   
tan
p <- predict(tan, car)
head(p)
## Not run: plot(tan)
nparams(tan)



