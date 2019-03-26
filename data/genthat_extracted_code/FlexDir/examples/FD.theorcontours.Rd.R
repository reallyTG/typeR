library(FlexDir)


### Name: FD.theorcontours
### Title: Contour Lines of a Flexible Dirichlet
### Aliases: FD.theorcontours

### ** Examples

alpha <- c(12,7,15)
prob <- c(0.3,0.4,0.3)
tau <- 8
FD.theorcontours(alpha,prob,tau)
FD.theorcontours(alpha,prob,tau, type='right', var=c(3,2), zoomed=FALSE, showgrid=TRUE, nlevels=3)




