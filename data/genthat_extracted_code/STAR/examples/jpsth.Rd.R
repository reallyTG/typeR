library(STAR)


### Name: jpsth
### Title: Related Functions and Methods for Joint-PSTHs and Joint Scatter
###   Diagrams
### Aliases: jpsth jsd contour.jpsth image.jpsth persp.jpsth jpsth2df
### Keywords: models

### ** Examples

## load e070528citronellal data
data(e070528citronellal)
## plot a jsd with neuron 1 on X and neuron 2 on Y
jsd(e070528citronellal[[1]],e070528citronellal[[2]])
## now make the jpsth
j1.2 <- jpsth(e070528citronellal[[1]],e070528citronellal[[2]])
## make a contour plot
contour(j1.2)
## make an image plot
image(j1.2)
## make a persp plot
persp(j1.2)
## Not run: 
##D ## fit a gss model with interactions
##D ## use a larger bin width for the jpsth
##D j1.2 <- jpsth(e070528citronellal[[1]],e070528citronellal[[2]],0.2,0.2)
##D ## get a data frame
##D j1.2DF <- jpsth2df(j1.2)
##D ## To save computation time start analyzing
##D ## just before the stimulation time
##D j1.2DF <- j1.2DF[j1.2DF$X > 6 & j1.2DF$Y>6,]
##D gf <- gssanova(Count ~ X*Y, family="poisson", data=j1.2DF,seed=20061001)
##D ## Use the project function of gss to check the significance
##D ## of the interaction term
##D project(gf2,inc=c("X","Y"))
## End(Not run)
## Not run: 
##D ## fit a gam model assuming no interaction
##D ## get a data frame
##D j1.2DF <- jpsth2df(j1.2)
##D fitNoI <- gam(Count ~ s(X,k=100,bs="cr") + s(Y,k=100,bs="cr"),data=j1.2DF,family=poisson())
## End(Not run)



