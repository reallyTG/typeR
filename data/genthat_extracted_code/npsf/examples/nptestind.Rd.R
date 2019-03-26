library(npsf)


### Name: nptestind
### Title: Nonparametric Test of Independence
### Aliases: nptestind
### Keywords: Data Envelopment Analysis Radial measure Nonparametric
###   efficiency analysis Linear programming Nonparametric test Bootstrap
###   summary

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
##D # Perform nonparametric test that radial (Debreu-Farrell) 
##D # output-based measure of technical efficiency under assumption of 
##D # NIRS technology and mix of outputs are independent. Test is 
##D # performed based on 999 replications at the 5##D 
##D 
##D t1 <- nptestind ( y1 + y2 + y3 ~ x1 + x2 + x3 + x4 + x5, 
##D 	data = ccr81, base = "o", rts = "n", 
##D 	reps = 999, dots = TRUE)
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
##D t2 <- nptestind ( Y ~ K + L + M, data = usmanuf, 
##D 	subset = year >= 1999 & year <= 2000, 
##D 	reps = 999, dots = TRUE, base = "i", rts = "v")
##D 
## End(Not run)




