library(minimaxdesign)


### Name: miniMaxPro
### Title: Compute minimax projection designs using clustering
### Aliases: miniMaxPro

### ** Examples

## Not run: 
##D #Generate a miniMaxPro design of 20 points on the unit hypercube [0,1]^8
##D des <- miniMaxPro(N=40,p=8,refine_itmax=100)
##D pairs(des$minimax,xlim=c(0,1),ylim=c(0,1),pch=16)
##D pairs(des$miniMaxPro,xlim=c(0,1),ylim=c(0,1),pch=16)
##D 
##D #Use the minimax design from mMc-PSO to warm start miniMaxPro at a new setting
##D mMdes <- mMcPSO(N=40,p=8)
##D newdes <- miniMaxPro(N=20,p=8,mMdes=mMdes,refine_itmax=100)
##D pairs(newdes$miniMaxPro,xlim=c(0,1),ylim=c(0,1),pch=16)
##D 
## End(Not run)



