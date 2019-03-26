library(mvprpb)


### Name: mvorpb
### Title: Depends: R(>= 3.0.3)
### Aliases: mvorpb
### Keywords: Orthant Probability

### ** Examples

dim.p <- 8
mu   <- c( rep(- 0.5   , dim.p -1) , 3 )
cov  <-  diag( dim.p )  * 0.5 + 0.5
n.itr <- 800
integ.range <- 10
res.val <-  mvorpb( dim.p , mu , cov  ,n.itr , integ.range )
print(res.val)



