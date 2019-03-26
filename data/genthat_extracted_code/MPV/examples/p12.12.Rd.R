library(MPV)


### Name: p12.12
### Title: Data Set for Problem 12-12
### Aliases: p12.12
### Keywords: datasets

### ** Examples

data(p12.12)
attach(p12.12)
# fitting the linearized model 
logy.lm <- lm(I(log(y))~I(log(x1))+I(log(x2)))
summary(logy.lm)
plot(logy.lm, which=1)  # checking the residuals
# fitting the nonlinear model
y.nls <- nls(y ~ theta1*I(x1^theta2)*I(x2^theta3), start=list(theta1=.95, 
theta2=.76, theta3=.21))
 summary(y.nls)
 plot(resid(y.nls)~fitted(y.nls)) # checking the residuals 



