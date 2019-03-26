library(GPArotation)


### Name: Random.Start
### Title: Generate a Random Orthogonal Rotation
### Aliases: Random.Start
### Keywords: multivariate

### ** Examples

   Global.min <- function(A,method,B=10){
      fv <- rep(0,B)
      seeds <- sample(1e+7, B)
      for(i in 1:B){
    	cat(i," ")
    	set.seed(seeds[i])
    	gpout <- GPFoblq(A=A, Random.Start(ncol(A)), method=method)
    	dtab <- dim(gpout$Table)
    	fv[i] <- gpout$Table[dtab[1],2]
    	cat(fv[i], "\n")
      }
      cat("Min is ",min(fv),"\n")
      set.seed(seeds[order(fv)[1]])
      ans <- GPFoblq(A=A, Random.Start(ncol(A)), method=method)
      ans
      }

   data("Thurstone", package="GPArotation")

   Global.min(box26,"simplimax",10)
   


