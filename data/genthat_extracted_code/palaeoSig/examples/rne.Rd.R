library(palaeoSig)


### Name: rne
### Title: Random, neighbour, environment deletion analysis for transfer
###   function model
### Aliases: rne plot.RNE
### Keywords: multivariate

### ** Examples

  require(fields)
  require(rioja)
  data(arctic.env)
  data(arctic.pollen)

  ## Don't show: 
    #using just the first 20 sites so that code runs in an reasonable time
    arctic.dist <- rdist.earth(cbind(arctic.env$Longitude, arctic.env$Latitude)[1:20,], miles = FALSE)
    
    arctic.rne <- rne(y = arctic.pollen[1:20,], env = arctic.env$tjul[1:20], geodist = arctic.dist, fun = MAT, neighbours = c(0,200), subsets = c(1,.5), k = 5)
    plot(arctic.rne)
  
## End(Don't show)
  ## No test: 
    #using just the first 100 sites so code runs in an reasonable time, but still slow
    arctic.d <- rdist.earth(arctic.env[1:100,c("Longitude","Latitude")], miles = FALSE)
    
    arctic.rne <- rne(y = arctic.pollen[1:100,], env = arctic.env$tjul[1:100],
        geodist = arctic.d, fun = MAT, neighbours = c(0,50,200), 
        subsets = c(1,.5,.1), k = 5)
    plot(arctic.rne)
  
## End(No test)




