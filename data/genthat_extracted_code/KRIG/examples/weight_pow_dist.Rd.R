library(KRIG)


### Name: weight_pow_dist
### Title: Generic weighted p-distance
### Aliases: weight_pow_dist

### ** Examples

library(KRIG)

n<-1e5
x<-runif( n )
y<-runif( n )
p<-rep(2.5,n)
w<-runif(n)

kw<-weight_pow_dist( x, y, w, p )
nw<-sum( w * abs( x - y )^p )

nw == kw



