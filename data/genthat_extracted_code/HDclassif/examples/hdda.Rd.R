library(HDclassif)


### Name: hdda
### Title: High Dimensional Discriminant Analysis
### Aliases: hdda

### ** Examples

# Example 1:
data<-simuldata(1000, 1000, 50, K=5)
X <- data$X
clx <- data$clx
Y <- data$Y
cly <- data$cly
# we get the HDDA parameters:
prms1 <- hdda(X, clx)         

cl1 <- predict(prms1, Y, cly)
# the class vector of Y estimated with HDDA:
cl1$class                     

# another model is used:
prms1 <- hdda(X, clx, model=12)
#model=12 is equivalent to model="ABQkD"     
cl1 <- predict(prms1, Y, cly) 

# Example 2:
data(wine)
a <- wine[,-1]
z <- wine[,1]
prms2 <- hdda(a, z, model='all', scaling=TRUE, d_select="bic", graph=TRUE)
cl2 <- predict(prms2, a, z)

# getting the best dimension
# using a common dimension model
# we do LOO-CV using cv.vfold=nrow(a)
prms3 <- hdda(a, z, model="akjbkqkd", d_select="CV", cv.vfold=nrow(a), scaling=TRUE, graph=TRUE)

cl3 <- predict(prms3, a, z)

# Example 3:
# Validation with LOO
prms4 = hdda(a, z, LOO=TRUE, scaling=TRUE)
sum(prms4$class==z) / length(z)




