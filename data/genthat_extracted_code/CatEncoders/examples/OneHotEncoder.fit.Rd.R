library(CatEncoders)


### Name: OneHotEncoder.fit
### Title: OneHotEncoder.fit fits an OneHotEncoder object
### Aliases: OneHotEncoder.fit

### ** Examples

# matrix input
X1 <- matrix(c(0, 1, 0, 1, 0, 1, 2, 0, 3, 0, 1, 2),c(4,3),byrow=FALSE)
oenc <- OneHotEncoder.fit(X1)
z <- transform(oenc,X1,sparse=TRUE)
# return a sparse matrix
print(z)

# data.frame
X2 <- cbind(data.frame(X1),X4=c('a','b','d',NA),X5=factor(c(1,2,3,1)))
oenc <- OneHotEncoder.fit(X2)
z <- transform(oenc,X2,sparse=FALSE)
# return a dense matrix
print(z)



