library(psych)


### Name: bestScales
### Title: A bootstrap aggregation (bagging) function for choosing most
###   predictive items
### Aliases: bestItems bestScales
### Keywords: models multivariate tree

### ** Examples

#This is an example of 'bagging' (bootstrap aggregation)
bestboot <- bestScales(bfi,criteria=cs(gender,age,education), 
 n.iter=10,dictionary=bfi.dictionary[1:3])
bestboot
#compare with 10 fold cross validation 
tenfold <- bestScales(bfi,criteria=cs(gender,age,education),fold=10,dictionary=bfi.dictionary[1:3])
tenfold
#Then, to display the results graphically
#Note that we scale the two graphs with the same x.lim values
error.dots(bestboot,eyes=TRUE,xlim=c(0,.4))
error.dots(tenfold,add=TRUE,pch=16,xlim=c(0,.4))




