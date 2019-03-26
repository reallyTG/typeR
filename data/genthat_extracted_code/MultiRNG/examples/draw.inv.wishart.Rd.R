library(MultiRNG)


### Name: draw.inv.wishart
### Title: Pseudo-Random Number Generation under Inverted Wishart
###   Distribution
### Aliases: draw.inv.wishart

### ** Examples

## No test: 
mymat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
draw.inv.wishart(no.row=1e5,d=3,nu=5,inv.sigma=mymat)
## End(No test)



