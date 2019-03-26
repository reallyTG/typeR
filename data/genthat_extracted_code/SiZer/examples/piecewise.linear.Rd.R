library(SiZer)


### Name: piecewise.linear
### Title: Creates a piecewise linear model
### Aliases: piecewise.linear

### ** Examples

data(Arkansas)
x <- Arkansas$year
y <- Arkansas$sqrt.mayflies

model <- piecewise.linear(x,y, CI=FALSE)
plot(model)
print(model)
predict(model, 2001)



