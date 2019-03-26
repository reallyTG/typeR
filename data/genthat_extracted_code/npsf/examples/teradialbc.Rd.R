library(npsf)


### Name: teradialbc
### Title: Statistical Inference Regarding the Radial Measure of Technical
###   Efficiency
### Aliases: teradialbc
### Keywords: Data Envelopment Analysis Radial measure Nonparametric
###   efficiency analysis Linear programming Bias-correction Bootstrap
###   Smoothed bootstrap Subsampling bootstrap Parallel computing summary

### ** Examples


## Not run: 
##D 
##D require( npsf )
##D 
##D # Prepare data and matrices
##D 
##D data( pwt56 )
##D head( pwt56 )
##D 
##D # Create some missing values
##D 
##D pwt56 [49, "K"] <- NA # just to create missing
##D 
##D Y1 <- as.matrix ( pwt56[ pwt56$year == 1965, c("Y"), drop = FALSE] )
##D X1 <- as.matrix ( pwt56[ pwt56$year == 1965, c("K", "L"), drop = FALSE] )
##D 
##D X1 [51, 2] <- NA # just to create missing
##D X1 [49, 1] <- NA # just to create missing
##D 
##D data( ccr81 )
##D head( ccr81 )
##D 
##D # Create some missing values
##D 
##D ccr81 [64, "x4"] <- NA # just to create missing
##D ccr81 [68, "y2"] <- NA # just to create missing
##D 
##D Y2 <- as.matrix( ccr81[ , c("y1", "y2", "y3"), drop = FALSE] )
##D X2 <- as.matrix( ccr81[ , c("x1", "x2", "x3", "x4", "x5"), drop = FALSE] )
##D 
##D # Compute output-based measures of technical efficiency under 
##D # the assumption of CRS (the default) and perform bias-correctiion
##D # using smoothed homogeneous bootstrap (the default) with 999
##D # replications (the default).
##D 
##D t1 <- teradialbc ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	data = ccr81)
##D 
##D # or just
##D 
##D t2 <- teradialbc ( Y2 ~ X2)
##D 
##D # Combined formula and matrix
##D 
##D t3 <- teradialbc ( Y ~ K + L, data = pwt56, subset = Nu < 10, 
##D 	ref = Y1[-2,] ~ X1[-1,] )
##D 
##D # Compute input-based measures of technical efficiency under 
##D # the assumption of VRS and perform bias-correctiion using
##D # subsampling heterogenous bootstrap with 1999 replications.
##D # Choose to report 99##D 
##D # formed by data points where x5 is not equal 10. 
##D # Suppress printing dots.
##D 
##D t4 <- teradialbc ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	data = ccr81, ref = y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	subset.ref = x5 != 10, data.ref = ccr81, reps = 1999, 
##D 	smoothed = FALSE, kappa = 0.7, dots = FALSE, 
##D 	base = "i", rts = "v", level = 99)
##D 
##D # Compute input-based measures of technical efficiency under
##D # the assumption of NRS and perform bias-correctiion using 
##D # smoothed heterogenous bootstrap with 499 replications for 
##D # all data points. The reference set formed by data points 
##D # where x5 is not equal 10.
##D 
##D t5 <- teradialbc ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	data = ccr81, ref = y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	subset.ref = x5 != 10, data.ref = ccr81, homogeneous = FALSE, 
##D 	reps = 999, smoothed = TRUE, dots = TRUE, base = "i", rts = "n")
##D 
##D 
##D # ===========================
##D # ===  Parallel computing ===
##D # ===========================
##D 
##D # Perform previous bias-correction but use 8 cores and 
##D # cluster type SOCK
##D 
##D t51 <-  teradialbc ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	data = ccr81, ref = y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	subset.ref = x5 != 10, data.ref = ccr81, homogeneous = FALSE, 
##D 	reps = 999, smoothed = TRUE, dots = TRUE, base = "i", rts = "n", 
##D 	core.count = 8, cl.type = "SOCK")
##D 
##D 
##D # Really large data-set
##D 
##D data(usmanuf)
##D head(usmanuf)
##D 
##D nrow(usmanuf)
##D table(usmanuf$year)
##D 
##D # This will take some time depending on computer power
##D 
##D data(usmanuf)
##D head(usmanuf)
##D 
##D t6 <- teradialbc ( Y ~ K + L + M, data = usmanuf, 
##D 	subset = year >= 1999 & year <= 2000, homogeneous = FALSE, 
##D 	base = "o", reps = 100, 
##D 	core.count = 8, cl.type = "SOCK")
##D 
## End(Not run)




