library(MOLHD)


### Name: pfpm
### Title: Generate the Pareto front for the optimal Latin Hypercube
###   Designs based on both the MaxPro and miniMax criteria.
### Aliases: pfpm
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate the Pareto front designs of maximum projection and minimax distance criteria for LHD(10,2)
## Not run: 
##D D1=mpLHD(n=10,p=2,times=1000,nstarts=30)
##D D2=miMLHD(n=10,p=2,num=15,nstarts=30)
##D mplim=c(D1$criterion-2,D1$criterion-2+20)
##D mMlim=c(D2$criterion-0.05,D2$criterion-0.05+0.5)
##D crlim=cbind(mplim,mMlim)
##D pf=pfpm(10,2,crlim,num = 15,nstarts = 30)
##D pf$pfvals
##D pf$pfdes
##D pf$time_rec
## End(Not run)



