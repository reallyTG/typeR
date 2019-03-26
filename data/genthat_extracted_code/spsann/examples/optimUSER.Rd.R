library(spsann)


### Name: optimUSER
### Title: Optimization of sample configurations using a user-defined
###   objective function
### Aliases: optimUSER USER
### Keywords: iteration optimize spatial

### ** Examples

## Not run: 
##D # This example takes more than 5 seconds
##D require(sp)
##D require(SpatialTools)
##D data(meuse.grid)
##D candi <- meuse.grid[, 1:2]
##D schedule <- scheduleSPSANN(chains = 1, initial.temperature = 30,
##D                            x.max = 1540, y.max = 2060, x.min = 0, 
##D                            y.min = 0, cellsize = 40)
##D 
##D # Define the objective function - number of points per lag distance class
##D objUSER <-
##D   function (points, lags, n_lags, n_pts) {
##D     dm <- SpatialTools::dist1(points[, 2:3])
##D     ppl <- vector()
##D     for (i in 1:n_lags) {
##D       n <- which(dm > lags[i] & dm <= lags[i + 1], arr.ind = TRUE)
##D       ppl[i] <- length(unique(c(n)))
##D     }
##D     distri <- rep(n_pts, n_lags)
##D     res <- sum(distri - ppl)
##D   }
##D lags <- seq(1, 1000, length.out = 10)
##D 
##D # Run the optimization using the user-defined objective function
##D set.seed(2001)
##D timeUSER <- Sys.time()
##D resUSER <- optimUSER(points = 10, fun = objUSER, lags = lags, n_lags = 9,
##D                      n_pts = 10, candi = candi, schedule = schedule)
##D timeUSER <- Sys.time() - timeUSER
##D 
##D # Run the optimization using the respective function implemented in spsann
##D set.seed(2001)
##D timePPL <- Sys.time()
##D resPPL <- optimPPL(points = 10, candi = candi, lags = lags, 
##D                    schedule = schedule)
##D timePPL <- Sys.time() - timePPL
##D 
##D # Compare results
##D timeUSER
##D timePPL
##D lapply(list(resUSER, resPPL), countPPL, candi = candi, lags = lags)
##D objSPSANN(resUSER) - objSPSANN(resPPL)
## End(Not run)



