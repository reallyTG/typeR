library(bnclassify)


### Name: predict.bnc_fit
### Title: Predicts class labels or class posterior probability
###   distributions.
### Aliases: predict.bnc_fit

### ** Examples

data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
p <- predict(nb, car)
head(p)
p <- predict(nb, car, prob = TRUE)
head(p)



