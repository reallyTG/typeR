library(MOLHD)


### Name: pfMm
### Title: Generate the Pareto front for the optimal Latin Hypercube
###   Designs based on both the Maximin and miniMax criteria.
### Aliases: pfMm
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate the Pareto front designs of maximin and minimax distance criterion for LHD(10,2)
## Not run: 
##D D1=MmLHD(n=10,p=2,nstarts=30)
##D D2=miMLHD(n=10,p=2,num=15,nstarts=30)
##D Mmlim=c(D1$criterion-0.2,D1$criterion-0.2+2)
##D mMlim=c(D2$criterion-0.05,D2$criterion-0.05+0.5)
##D crlim=cbind(Mmlim,mMlim)
##D pf=pfMm(10,2,crlim,num = 15,nstarts = 30)
##D pf$pfvals
##D pf$pfdes
##D pf$time_rec
## End(Not run)



