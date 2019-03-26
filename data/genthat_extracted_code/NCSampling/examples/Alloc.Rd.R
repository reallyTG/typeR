library(NCSampling)


### Name: Alloc
### Title: Allocation
### Aliases: Alloc

### ** Examples

popfile<-data.frame(PID=1:20, Strata=rep(c('A', 'B'),c(12,8)),
 	plot_type=rep('B',20))
tot.samp<-6
Alloc(popfile, tot.samp)



