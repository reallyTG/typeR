library(structree)


### Name: guPrenat
### Title: Prenatal Care in Guatemala
### Aliases: guPrenat

### ** Examples

data(guPrenat)

y <- guPrenat$prenat
community <- guPrenat$cluster

table(y)
hist(table(community))
 



