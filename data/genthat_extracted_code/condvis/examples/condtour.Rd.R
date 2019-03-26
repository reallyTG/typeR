library(condvis)


### Name: condtour
### Title: Conditional tour; a tour through sections in data space
### Aliases: condtour

### ** Examples

## Not run: 
##D 
##D data(powerplant)
##D library(e1071)
##D model <- svm(PE ~ ., data = powerplant)
##D path <- makepath(powerplant[-5], 25)
##D condtour(data = powerplant, model = model, path = path$path,
##D   sectionvars = "AT")
##D 
##D data(wine)
##D wine$Class <- as.factor(wine$Class)
##D library(e1071)
##D model5 <- list(svm(Class ~ ., data = wine))
##D conditionvars1 <- setdiff(colnames(wine), c("Class", "Hue", "Flavanoids"))
##D path <- makepath(wine[, conditionvars1], 50)
##D condtour(data = wine, model = model5, path = path$path, sectionvars = c("Hue"
##D   , "Flavanoids"), threshold = 3)
##D 
## End(Not run)



