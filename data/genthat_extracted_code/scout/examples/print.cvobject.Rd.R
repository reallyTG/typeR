library(scout)


### Name: print.cvobject
### Title: Print function for scout
### Aliases: print.cvobject

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
# Split data into training and test set
training <- sample(nrow(x2),floor(nrow(x2)/2))
xtrain <- x2[training,]
ytrain <- y[training]
# Done splitting data into training and test set
# Do cross-validation to determine best tuning parameter values for Scout(1,1)
## Not run: cv.out <- cv.scout(xtrain,ytrain,p1=1,p2=1, lam1s=seq(0.001,0.1), K=4)
## Not run: print(cv.out)
# Done cross-validation
detach(diabetes)



