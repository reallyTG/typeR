library(GEOmap)


### Name: CCcheck
### Title: Counter Clockwise check
### Aliases: CCcheck
### Keywords: misc

### ** Examples



Y=list()
Y$x=c(170,175,184,191,194,190,177,166,162,164)
Y$y=c(-54,-60,-60,-50,-26,8,34,37,10,-15)

plot(c(160, 200),c(-85, 85), type='n')
points(Y)
lines(Y)

CCcheck(Y)


Z = list(x=rev(Y$x), y=rev(Y$y))

CCcheck(Z)




