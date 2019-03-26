library(dismo)


### Name: evaluate
### Title: Model evaluation
### Aliases: evaluate
### Keywords: spatial

### ** Examples

## See ?maxent for an example with real data.
# this is a contrived example:
# p has the predicted values for 50 known cases (locations) 
# with presence of the phenomenon (species)
p <- rnorm(50, mean=0.7, sd=0.3)
# b has the predicted values for 50 background locations (or absence)
a <- rnorm(50, mean=0.4, sd=0.4)
e <- evaluate(p=p, a=a)

threshold(e)

plot(e, 'ROC')
plot(e, 'TPR')
boxplot(e)
density(e)

str(e)



