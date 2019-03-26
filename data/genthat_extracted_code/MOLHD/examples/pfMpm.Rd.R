library(MOLHD)


### Name: pfMpm
### Title: Generate the Pareto front for the optimal Latin Hypercube
###   Designs based on the Maximin, MaxPro and miniMax criteria.
### Aliases: pfMpm
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate the Pareto front designs of maximin distance,
#minimax diatance, and maximum projection criterion for LHD(10,2)
## Not run: 
##D D1=MmLHD(n=10,p=2,nstarts=30)
##D D2=mpLHD(n=10,p=2,nstarts=30)
##D D3=miMLHD(n=10,p=2,num=15,nstarts=30)
##D Mmlim=c(D1$criterion-0.2,D1$criterion-0.2+2)
##D mplim=c(D2$criterion-2,D2$criterion-2+10)
##D mMlim=c(D3$criterion-0.05,D3$criterion-0.05+0.5)
##D crlim=cbind(Mmlim,mplim,mMlim)
##D pf=pfMpm(10,2,crlim,num = 15,nstarts = 30)
##D pf$pfvals
##D pf$pfdes
##D pf$time_rec
## End(Not run)



