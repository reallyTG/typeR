library(GEOmap)


### Name: explode
### Title: Explode Points
### Aliases: explode
### Keywords: misc

### ** Examples



############  random data
x = rnorm(20)
y = rnorm(20)

NEW = explode(list(x=x,y=y), dixplo =1)

plot(range(c(x,NEW$x)), range(c(y,NEW$y)), asp=1, type='n')
segments(x,y,NEW$x, NEW$y)
points(x,y, pch=3, col='red')
points(NEW$x, NEW$y, pch=6, col='blue', cex=2)


###  try a larger radius:
NEW2 = explode(list(x=x,y=y), dixplo =1.3)
points(NEW2$x, NEW2$y, pch=7, col='brown', cex=2, xpd=TRUE)
arrows(NEW$x, NEW$y,NEW2$x, NEW2$y, col='green' )



#####   try with a different center
cenx=-1; ceny=-1
NEW = explode(list(x=x,y=y), dixplo =1, cenx=cenx, ceny=ceny)
plot(range(c(x,NEW$x)), range(c(y,NEW$y)), asp=1, type='n')
points(x,y, pch=3, col='red')
segments(x,y,NEW$x, NEW$y)
points(NEW$x, NEW$y, pch=6, col='blue', cex=2)
points(cenx, ceny, pch=8, col='purple')
text(cenx, ceny, labels="Center Point", pos=1)






