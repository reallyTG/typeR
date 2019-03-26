library(MNM)


### Name: mv.l1lm
### Title: Linear Regression Based on Identity, Spatial Sign or Spatial
###   Rank Scores
### Aliases: mv.l1lm
### Keywords: multivariate nonparametric regression

### ** Examples

# creating simple data

X <- cbind(rep(1,100),rmvnorm(100,c(0,0,0)) )
B <- matrix(c(4,1,1,0.5,-3,2,2,2),ncol=4, byrow=TRUE)
Y <- X %*% t(B)+ rmvnorm(100,c(0,0), diag(0.2,2))
DAT <- data.frame(x1=X[,2],x2=X[,3], x3=X[,4], Y=I(Y))

# true B
t(B)

# example using identity scores
test1 <- mv.l1lm(Y ~ x1 + x2 + x3, data=DAT)

print(test1)
summary(test1)
coef(test1)
vcov(test1)
head(fitted(test1))
head(residuals(test1))

# example using outer sign scores
test2 <- mv.l1lm(Y ~ x1 + x2 + x3, scores= "s", data=DAT)

print(test2)
summary(test2)
coef(test2)
vcov(test2)
head(fitted(test2))
head(residuals(test2))

# example using inner sign scores
test3 <- mv.l1lm(Y ~ x1 + x2 + x3, scores= "s", stand="i", 
data=DAT)

print(test3)
summary(test3)
coef(test3)
vcov(test3)
head(fitted(test3))
head(residuals(test3))

# example using outer rank scores
test4 <- mv.l1lm(Y ~ x1 + x2 + x3, scores= "r", stand="o", 
data=DAT)

print(test4)
summary(test4)
coef(test4)
vcov(test4)
head(fitted(test4))
head(residuals(test4))

# example using inner rank scores
test5 <- mv.l1lm(Y ~ x1 + x2 + x3, scores= "r", stand="i", 
data=DAT)

print(test5)
summary(test5)
coef(test5)
vcov(test5)
head(fitted(test5))
head(residuals(test5))

# prediction

newData <- data.frame(x1=c(1,-2),x2=c(0.5,0.7), x3=c(-1,-1))
newData
predict(test1,newData)
predict(test2,newData)
predict(test3,newData)
predict(test4,newData)
predict(test5,newData)




