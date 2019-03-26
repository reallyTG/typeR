library(rrepast)


### Name: Easy.Calibration
### Title: Easy.Calibration
### Aliases: Easy.Calibration

### ** Examples

## Not run: 
##D  my.cost<- function(params, results) {
##D    criteria<- c()
##D    Rate<- AoE.RMSD(results$X.Simulated,results$X.Experimental)
##D    G<- AoE.RMSD(results$G.T.,52)
##D    total<- Rate + G
##D    criteria<- cbind(total,Rate,G)
##D    return(criteria)
##D  }
##D  
##D  Easy.Setup("/models/BactoSim")
##D  v<- Easy.Calibration("/models/BactoSim","ds::Output",360,
##D                        f,exp.n = 1000, exp.r=1, smax=4, 
##D                        design="mcs", my.cost)
##D  
## End(Not run)




