library(bnclassify)


### Name: accuracy
### Title: Compute predictive accuracy.
### Aliases: accuracy

### ** Examples

 
data(car)
nb <- bnc('nb', 'class', car, smooth = 1)
p <- predict(nb, car)
accuracy(p, car$class)



