library(multimode)


### Name: modetree
### Title: Mode tree
### Aliases: modetree
### Keywords: graphical tools

### ** Examples

#Mode tree using a grid of bandwidths between 0.2 and 0.5
set.seed(2016)
data=rnorm(50)
modetree(data,bws=c(0.2,0.5))
## Not run: 
##D #Estimated locations of the five modes in the claw of Marron and Wand (1992)
##D library(nor1mix)
##D set.seed(2016)
##D n<-200
##D data<-nor1mix::rnorMix(n,MW.nm10)
##D #Mode tree between the critical bandwidths for 1 and 8 modes
##D modetree(data,cbw1=1,cbw2=8)
##D abline(v=1.5);abline(v=-1.5)
## End(Not run)



