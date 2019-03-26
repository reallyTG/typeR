library(SiZer)


### Name: locally.weighted.polynomial
### Title: Smoothes the given bivariate data using kernel regression.
### Aliases: locally.weighted.polynomial

### ** Examples

data(Arkansas)
x <- Arkansas$year
y <- Arkansas$sqrt.mayflies
layout(cbind(1,2,3))
model <- locally.weighted.polynomial(x,y)
plot(model, main='Smoothed Function', xlab='Year', ylab='Sqrt.Mayflies')

model2 <- locally.weighted.polynomial(x,y,h=.5)
plot(model2, main='Smoothed Function', xlab='Year', ylab='Sqrt.Mayflies')

model3 <- locally.weighted.polynomial(x,y, degree=1)
plot(model3, derv=1, main='First Derivative', xlab='Year', ylab='1st Derivative')




