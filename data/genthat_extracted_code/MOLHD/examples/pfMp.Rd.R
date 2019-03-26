library(MOLHD)


### Name: pfMp
### Title: Generate the Pareto front for optimal Latin Hypercube Designs
###   based on both the Maximin and the MaxPro criteria.
### Aliases: pfMp
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate the Pareto designs of maximin distance and maximum projection for LHD(10,5)
## Not run: 
##D D1=MmLHD(n=10,p=5,nstarts=30)
##D D2=mpLHD(n=10,p=5,nstarts=30)
##D Mmlim=c(D1$criterion-0.2,D1$criterion-0.2+2)
##D mplim=c(D2$criterion-2,D2$criterion-2+10)
##D crlim=cbind(Mmlim,mplim)
##D pf=pfMp(10,5,crlim,nstarts = 30)
##D pf$pfvals
##D pf$pfdes
##D pf$time_rec
## End(Not run)



