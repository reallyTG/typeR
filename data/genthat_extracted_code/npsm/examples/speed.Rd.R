library(npsm)


### Name: speed
### Title: Predict top speed based on miles per gallon
### Aliases: speed
### Keywords: datasets

### ** Examples

data(speed)
plot(sp~mpg,data=speed)
rfit(sp~mpg+I(mpg^2),data=speed)



