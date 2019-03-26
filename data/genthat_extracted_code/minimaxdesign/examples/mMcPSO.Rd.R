library(minimaxdesign)


### Name: mMcPSO
### Title: Compute minimax designs using clustering
### Aliases: mMcPSO

### ** Examples


## Not run: 
##D #Generate and plot a minimax design with 20 points on the unit hypercube [0,1]^2
##D desuh <- mMcPSO(N=20,p=2)
##D plot(desuh,xlim=c(0,1),ylim=c(0,1),pch=16)
##D 
##D #Generate and plot a minimax design with 20 points on the unit simplex A_2
##D # ... (CtoA provides the mapping from [0,1]^2 to A_2, see ?CtoA)
##D dessimp <- mMcPSO(N=20,p=2,region="simp")
##D plot(dessimp,xlim=c(0,1),ylim=c(0,1),pch=16)
##D abline(0,1)
##D 
##D #Generate and plot a minimax design with 20 points on the unit ball B_2
##D # ... (CtoB2 provides the mapping from [0,1]^2 to B_2, see ?CtoB2)
##D library(plotrix)
##D desball <- mMcPSO(N=20,p=2,region="ball")
##D plot(desball,xlim=c(-1,1),ylim=c(-1,1),pch=16)
##D draw.circle(0,0,1) #design boundaries
##D 
##D #Generate and plot a minimax design with 20 points on the unit hypercube [0,1]^4
##D desuh <- mMcPSO(N=20,p=4)
##D pairs(desuh,xlim=c(0,1),ylim=c(0,1),pch=16)
## End(Not run)



