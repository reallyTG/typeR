library(TreePar)


### Name: bd.densdep.optim
### Title: bd.densdep.optim: Estimating maximum likelihood speciation and
###   extinction rates in phylogenies under a density-dependent speciation
###   model.
### Aliases: bd.densdep.optim

### ** Examples

set.seed(1)
x<-c(10:1)
## No test: 
bd.densdep.optim(x,discrete=FALSE,continuous=TRUE)

# Laser returns same result for Yule model
res <- -bd.densdep.optim(x,Yule=TRUE,discrete=FALSE,continuous=TRUE)[[2]]$value 
res<-res+ sum(log(2:length(x)))
res

# library(laser)
# DDL(x)
## End(No test)



