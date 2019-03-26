library(CatEncoders)


### Name: LabelEncoder.fit
### Title: LabelEncoder.fit fits a LabelEncoder object
### Aliases: LabelEncoder.fit

### ** Examples

# factor y
y <- factor(c('a','d','e',NA),exclude=NULL)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,factor(c('d','d',NA,'f')))
print(z)

# character y
y <- c('a','d','e',NA)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <- transform(lenc,c('d','d',NA,'f'))
print(z)

# numeric y
set.seed(123)
y <- sample(c(1:10,NA),5)
lenc <- LabelEncoder.fit(y)
# new values are transformed to NA
z <-transform(lenc,sample(c(1:10,NA),5))
print(z)



