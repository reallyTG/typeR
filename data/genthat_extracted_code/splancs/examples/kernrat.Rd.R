library(splancs)


### Name: kernrat
### Title: Ratio of two kernel smoothings
### Aliases: kernrat
### Keywords: spatial

### ** Examples

data(okwhite)
data(okblack)
okpoly <- list(x=c(okwhite$x, okblack$x), y=c(okwhite$y, okblack$y))
kr <- kernrat(as.points(okwhite), as.points(okblack), bboxx(bbox(as.points(okpoly))),
 h1=50, h2=50)
image(kr, asp=1)
brks <- quantile(c(kr$z), seq(0,1,1/10), na.rm=TRUE)
lbrks <- formatC(brks, 3, 6, "g", " ") 
cols <- heat.colors(length(brks)-1)
def.par <- par(no.readonly = TRUE)
layout(matrix(c(1,0,1,2), 2, 2, byrow = TRUE), c(2.5,1.5), c(1,3), TRUE)
image(kr, breaks=brks, col=cols, asp=1)
plot.new()
legend(c(0,1), c(0,1), legend=paste(lbrks[-length(lbrks)], lbrks[-1], sep=":"), fill=cols, bty="n")
par(def.par)



