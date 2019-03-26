library(Rquake)


### Name: XYerror.bars
### Title: Error Bars in X and Y
### Aliases: XYerror.bars
### Keywords: misc

### ** Examples



set.seed(0)
zup = rnorm(10)

x = 1:10
y = 2*x+5+zup

ydown = rnorm(10)
ydown = ydown-min(ydown)+.2

yup = rnorm(10)
yup = yup-min(yup)+.2



zup = rnorm(10)
xup = zup-min(zup)+.5
xdown = rnorm(10)
xdown = xdown-min(xdown)+.2


####  example with different  error on either side:
XYerror.bars(x, y, y-ydown, y+yup, x-xdown, x+xup,
 pch = 1, col = 'brown' , barw = 0.1, add
= FALSE)






