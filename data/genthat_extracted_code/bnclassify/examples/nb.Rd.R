library(bnclassify)


### Name: nb
### Title: Learn a naive Bayes network structure.
### Aliases: nb

### ** Examples

 
data(car)
nb <- nb('class', car)   
nb2 <- nb('class', features = letters[1:10])
## Not run: plot(nb2)



