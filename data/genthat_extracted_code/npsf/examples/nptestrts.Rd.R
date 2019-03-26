library(npsf)


### Name: nptestrts
### Title: Nonparametric Test of Returns to Scale
### Aliases: nptestrts
### Keywords: Data Envelopment Analysis Radial measure Nonparametric
###   efficiency analysis Linear programming Nonparametric test Bootstrap
###   Smoothed bootstrap Subsampling bootstrap Parallel computing summary

### ** Examples


## Not run: 
##D 
##D require( npsf )
##D 
##D # Prepare data and matrices
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
##D # Perform output-based test of returns to scale smoothed 
##D # homogeneous bootstrap with 999 replications at the 5##D 
##D # significance level.  Also perform Test #2
##D 
##D t1 <- nptestrts(y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5,
##D 	data = ccr81, homogeneous = TRUE,
##D 	reps = 999, dots = TRUE, base = "o")
##D 
##D # suppress printing replication dots
##D t2 <- nptestrts(Y2 ~ X2,
##D 	homogeneous = TRUE,
##D 	reps = 100, dots = FALSE, base = "o")
##D 
##D 
##D # heterogeneous
##D t3 <- nptestrts(Y2 ~ X2,
##D 	homogeneous = FALSE,
##D 	reps = 100, dots = TRUE, base = "o")
##D 
##D 
##D # ===========================
##D # ===  Parallel computing ===
##D # ===========================
##D 
##D # Perform previous test but use 8 cores and
##D # cluster type SOCK
##D 
##D t3 <-  nptestrts(y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5,
##D 	data = ccr81, homogeneous = FALSE,
##D 	reps = 100, dots = TRUE, base = "o",
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
##D # Figure industries to include in the sample (first quarter)
##D 
##D summary(usmanuf[usmanuf$year >= 1999 & usmanuf$year < 2000, "naics"])
##D 
##D # This test is quite demanding and it will take some time
##D # depending on computer power
##D 
##D t4 <- nptestrts(Y ~ K + L + M, data = usmanuf,
##D 	subset = year >= 1999 & year < 2000 & naics < 321900,
##D 	homogeneous = FALSE, reps = 100, dots = TRUE, base = "o",
##D 	core.count = 8, cl.type = "SOCK")
##D 
##D # This is very computer intensive task
##D 
##D t5 <- nptestrts(Y ~ K + L + M, data = usmanuf,
##D 	subset = year >= 1999 & year < 2000,
##D 	homogeneous = FALSE, reps = 100, dots = TRUE, base = "o",
##D 	core.count = 8, cl.type = "SOCK")
##D 
## End(Not run)




