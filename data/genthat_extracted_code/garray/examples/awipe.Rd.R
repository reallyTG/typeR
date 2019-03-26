library(garray)


### Name: awipe
### Title: Generalized array's sweep() for data cleaning.
### Aliases: awipe

### ** Examples

a <- garray(1:24, c(4,6), list(X=LETTERS[1:4], Y=letters[1:6]),
	sdim=list(XX=c(x1=3,x2=1), YY=c(y1=1,y2=2)))
m1 <- awipe(a, MARGIN="XX")
m2 <- awipe(a, `-`, mean, "XX")



