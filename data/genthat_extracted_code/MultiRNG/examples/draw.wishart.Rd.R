library(MultiRNG)


### Name: draw.wishart
### Title: Pseudo-Random Number Generation under Wishart Distribution
### Aliases: draw.wishart

### ** Examples

## No test: 
mymat<-matrix(c(1,0.2,0.3,0.2,1,0.2,0.3,0.2,1), nrow=3, ncol=3)
draw.wishart(no.row=1e5,d=3,nu=5,sigma=mymat)
## End(No test)



