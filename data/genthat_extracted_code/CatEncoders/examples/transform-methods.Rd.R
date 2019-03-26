library(CatEncoders)


### Name: transform
### Title: transform transforms a new data set using the fitted encoder
### Aliases: LabelEncoder.Character,character-method
###   LabelEncoder.Numeric,numeric-method transform transform,
###   transform,LabelEncoder.Character-method
###   transform,LabelEncoder.Factor,factor-method
###   transform,LabelEncoder.Factor-method
###   transform,LabelEncoder.Numeric-method
###   transform,OneHotEncoder,Any,logical-method
###   transform,OneHotEncoder-method

### ** Examples

# matrix X
X1 <- matrix(c(0, 1, 0, 1, 0, 1, 2, 0, 3, 0, 1, 2),c(4,3),byrow=FALSE)
oenc <- OneHotEncoder.fit(X1)
z <- transform(oenc,X1,sparse=TRUE)
# return a sparse matrix
print(z)

# data.frame X
X2 <- cbind(data.frame(X1),X4=c('a','b','d',NA),X5=factor(c(1,2,3,1)))
oenc <- OneHotEncoder.fit(X2)
z <- transform(oenc,X2,sparse=FALSE)
# return a dense matrix
print(z)

# factor vector y
y <- factor(c('a','d','e',NA),exclude=NULL)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,factor(c('d','d',NA,'f')))
print(z)

# character vector y
y <- c('a','d','e',NA)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,c('d','d',NA,'f'))
print(z)

# numeric vector y
set.seed(123)
y <- sample(c(1:10,NA),5)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <-transform(lenc,sample(c(1:10,NA),5))
print(z)



