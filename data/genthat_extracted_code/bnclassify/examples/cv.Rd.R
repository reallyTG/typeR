library(bnclassify)


### Name: cv
### Title: Estimate predictive accuracy with stratified cross validation.
### Aliases: cv

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1) 
# CV a single classifier
cv(nb, car, k = 10) 
nb_manb <- bnc('nb', 'class', car, smooth = 1, manb_prior = 0.5) 
cv(list(nb=nb, manb=nb_manb), car, k = 10)
# Get accuracies on each fold
cv(list(nb=nb, manb=nb_manb), car, k = 10, mean = FALSE)
ode <- bnc('tan_cl', 'class', car, smooth = 1, dag_args = list(score = 'aic')) 
# keep structure fixed accross training subsamples
cv(ode, car, k = 10, dag = FALSE)



