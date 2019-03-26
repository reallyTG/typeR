library(mistat)


### Name: OELECT1
### Title: Electric Voltage Outputs of Another Rectifying Circuit
### Aliases: OELECT1
### Keywords: datasets

### ** Examples

data(OELECT)

data(OELECT1)

randomizationTest(list(a=OELECT, b=OELECT1), 
                  R=500, calc=mean, 
                  fun=function(x) x[1]-x[2])



