library(PEIP)


### Name: error.bar
### Title: Plot Error Bar
### Aliases: error.bar
### Keywords: misc

### ** Examples

x = 1:10
y = 2*x+5
zup = rnorm(10)


zup = zup-min(zup)+.5
zdown = rnorm(10)
zdown = zdown-min(zdown)+.2


####  example with same error on either side:
error.bar(x, y, y-zup, y+zup, pch = 1, col = 'brown' , barw = 0.1, add =
FALSE)


####  example with different  error on either side:
error.bar(x, y, y-zdown, y+zup, pch = 1, col = 'brown' , barw = 0.1, add
= FALSE)







