library(scout)


### Name: print.scoutobject
### Title: Print function for scout
### Aliases: print.scoutobject

### ** Examples

library(lars)
data(diabetes)
attach(diabetes)
# Split data into training and test set
training <- sample(nrow(x2),floor(nrow(x2)/2))
xtrain <- x2[training,]
ytrain <- y[training]
xtest <- x2[-training,]
ytest <- y[-training]
# Done splitting data into training and test set
# Fit Model
scout.object <- scout(xtrain,ytrain,p1=1,p2=1,lam1s=c(0.001,0.1),lam2s=c(0.01,0.2))
print(scout.object)
# Done Fitting Model
detach(diabetes)



