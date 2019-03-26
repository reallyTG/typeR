library(greybox)


### Name: alm
### Title: Advanced Linear Model
### Aliases: alm
### Keywords: models nonlinear regression ts

### ** Examples


### An example with mtcars data and factors
mtcars2 <- within(mtcars, {
   vs <- factor(vs, labels = c("V", "S"))
   am <- factor(am, labels = c("automatic", "manual"))
   cyl  <- ordered(cyl)
   gear <- ordered(gear)
   carb <- ordered(carb)
})
# The standard model with Log Normal distribution
ourModel <- alm(mpg~., mtcars2[1:30,], distribution="dlnorm")
summary(ourModel)
plot(ourModel)

# Produce predictions with the one sided interval (upper bound)
predict(ourModel, mtcars2[-c(1:30),], interval="p", side="u")


### Artificial data for the other examples
xreg <- cbind(rlaplace(100,10,3),rnorm(100,50,5))
xreg <- cbind(100+0.5*xreg[,1]-0.75*xreg[,2]+rlaplace(100,0,3),xreg,rnorm(100,300,10))
colnames(xreg) <- c("y","x1","x2","Noise")
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]

# An example with Laplace distribution
ourModel <- alm(y~x1+x2, inSample, distribution="dlaplace")
summary(ourModel)
plot(predict(ourModel,outSample))

# And another one with Asymmetric Laplace distribution (quantile regression)
# with optimised alpha
ourModel <- alm(y~x1+x2, inSample, distribution="dalaplace")
summary(ourModel)
plot(predict(ourModel,outSample))


### Examples with the count data
xreg[,1] <- round(exp(xreg[,1]-70),0)
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]

# Negative Binomial distribution
ourModel <- alm(y~x1+x2, inSample, distribution="dnbinom")
summary(ourModel)
predict(ourModel,outSample,interval="p",side="u")

# Poisson distribution
ourModel <- alm(y~x1+x2, inSample, distribution="dpois")
summary(ourModel)
predict(ourModel,outSample,interval="p",side="u")


### Examples with binary response variable
xreg[,1] <- round(xreg[,1] / (1 + xreg[,1]),0)
inSample <- xreg[1:80,]
outSample <- xreg[-c(1:80),]

# Logistic distribution (logit regression)
ourModel <- alm(y~x1+x2, inSample, distribution="plogis")
summary(ourModel)
plot(predict(ourModel,outSample,interval="c"))

# Normal distribution (probit regression)
ourModel <- alm(y~x1+x2, inSample, distribution="pnorm")
summary(ourModel)
plot(predict(ourModel,outSample,interval="p"))




