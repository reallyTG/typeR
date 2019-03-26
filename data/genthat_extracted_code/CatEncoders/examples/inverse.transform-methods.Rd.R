library(CatEncoders)


### Name: inverse.transform
### Title: inverse.transform transforms an integer vector back to the
###   original vector
### Aliases: inverse.transform
###   inverse.transform,LabelEncoder,numeric-method

### ** Examples

# character vector y
y <- c('a','d','e',NA)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,c('d','d',NA,'f'))
print(z)
inverse.transform(lenc,z)

# factor vector y
y <- factor(c('a','d','e',NA),exclude=NULL)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,factor(c('a','d',NA,'f')))
inverse.transform(lenc,z)

# numeric vector y
set.seed(123)
y <- c(1:10,NA)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
newy <- sample(c(1:10,NA),5)
print(newy)
z <-transform(lenc,newy)
inverse.transform(lenc, z)



