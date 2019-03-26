library(dave)


### Name: orank
### Title: Ranking by orthogonal components (RANK)
### Aliases: orank orank.default plot.orank summary.orank orank1
### Keywords: multivariate arith

### ** Examples

# Uses vegetation data frame sveg with vegetation data
# and ssit with corresponding x- and y-axes scores
x.axis=ssit$x.axis ; y.axis=ssit$y.axis
o.orank<- orank(sveg,use="rows",rlimit=5,y=0.25,x.axis,y.axis)
plot(o.orank)



