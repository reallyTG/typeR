library(pracma)


### Name: hurstexp
### Title: Hurst Exponent
### Aliases: hurstexp
### Keywords: timeseries

### ** Examples

##  Computing the Hurst exponent
data(brown72)
x72 <- brown72                          #  H = 0.72
xgn <- rnorm(1024)                      #  H = 0.50
xlm <- numeric(1024); xlm[1] <- 0.1     #  H = 0.43
for (i in 2:1024) xlm[i] <- 4 * xlm[i-1] * (1 - xlm[i-1])

hurstexp(brown72, d = 128)           # 0.72
# Simple R/S Hurst estimation:         0.6590931 
# Corrected R over S Hurst exponent:   0.7384611 
# Empirical Hurst exponent:            0.7068613 
# Corrected empirical Hurst exponent:  0.6838251 
# Theoretical Hurst exponent:          0.5294909

hurstexp(xgn)                        # 0.50
# Simple R/S Hurst estimation:         0.5518143 
# Corrected R over S Hurst exponent:   0.5982146 
# Empirical Hurst exponent:            0.6104621 
# Corrected empirical Hurst exponent:  0.5690305 
# Theoretical Hurst exponent:          0.5368124 

hurstexp(xlm)                        # 0.43
# Simple R/S Hurst estimation:         0.4825898 
# Corrected R over S Hurst exponent:   0.5067766 
# Empirical Hurst exponent:            0.4869625 
# Corrected empirical Hurst exponent:  0.4485892 
# Theoretical Hurst exponent:          0.5368124 


##  Compare with other implementations
## Not run: 
##D library(fractal)
##D 
##D x <- x72
##D hurstSpec(x)                    # 0.776   # 0.720
##D RoverS(x)                       # 0.717
##D hurstBlock(x, method="aggAbs")  # 0.648
##D hurstBlock(x, method="aggVar")  # 0.613
##D hurstBlock(x, method="diffvar") # 0.714
##D hurstBlock(x, method="higuchi") # 1.001
##D 
##D x <- xgn
##D hurstSpec(x)                    # 0.538   # 0.500
##D RoverS(x)                       # 0.663
##D hurstBlock(x, method="aggAbs")  # 0.463
##D hurstBlock(x, method="aggVar")  # 0.430
##D hurstBlock(x, method="diffvar") # 0.471
##D hurstBlock(x, method="higuchi") # 0.574
##D 
##D x <- xlm
##D hurstSpec(x)                    # 0.478   # 0.430
##D RoverS(x)                       # 0.622
##D hurstBlock(x, method="aggAbs")  # 0.316
##D hurstBlock(x, method="aggVar")  # 0.279
##D hurstBlock(x, method="diffvar") # 0.547
##D hurstBlock(x, method="higuchi") # 0.998
## End(Not run)



