library(Rambo)


### Name: plot.rsm
### Title: Plot an object from class rsm
### Aliases: plot.rsm

### ** Examples

data(Regions)
res <- rsm(Regions$X, Regions$sub, Klist=2:4, nbredo=1, maxit=5) 
##plot(res, frame=0)
## plot(res, frame=1)
 plot(res, frame=2)



