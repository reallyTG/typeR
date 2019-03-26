library(ipred)


### Name: dystrophy
### Title: Detection of muscular dystrophy carriers.
### Aliases: dystrophy
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D data("dystrophy")
##D library("rpart")
##D errorest(Class~CK+H~AGE+PK+LD, data = dystrophy, model = inbagg, 
##D pFUN = list(list(model = lm, predict = mypredict.lm), list(model = rpart)), 
##D ns = 0.75, estimator = "cv")
## End(Not run)



