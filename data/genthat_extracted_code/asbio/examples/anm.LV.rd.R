library(asbio)


### Name: anm.LV
### Title: Animated depictions of Lotka-Volterra competition and
###   exploitation models
### Aliases: anm.LVcomp anm.LVexp anm.LVc.tck anm.LVe.tck
### Keywords: graphs

### ** Examples

## Not run: 
##D 
##D #---------------------- Competition ---------------------#
##D ##Species 2 drives species 1 to extinction
##D anm.LVcomp(n1=150,n2=50,r1=.7,r2=.8,K1=200,K2=1000,a2.1=.5,a1.2=.7,time=seq(0,200))
##D ##Species coexist with numbers below carrying capacities
##D anm.LVcomp(n1=150,n2=50,r1=.7,r2=.8,K1=750,K2=1000,a2.1=.5,a1.2=.7,time=seq(0,200))
##D 
##D #----------------------Exploitation----------------------#
##D #Fast cycles
##D anm.LVexp(nh=300,np=50,rh=.7,con=.4,p=.006,d.p=.2,time=seq(0,200))
## End(Not run)



