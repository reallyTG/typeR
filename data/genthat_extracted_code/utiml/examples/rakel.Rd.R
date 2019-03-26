library(utiml)


### Name: rakel
### Title: Random k-labelsets for multilabel classification
### Aliases: rakel

### ** Examples

model <- rakel(toyml, "RANDOM")
pred <- predict(model, toyml)
## Not run: 
##D ## SVM using k = 4 and m = 100
##D model <- rakel(toyml, "SVM", k=4, m=100)
##D 
##D ## Random Forest using disjoint labelsets
##D model <- rakel(toyml, "RF", overlapping=FALSE)
## End(Not run)



