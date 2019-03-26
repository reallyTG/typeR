library(MeanShift)


### Name: projectCurveWavelets
### Title: Function to project a curve on a wavelet basis.
### Aliases: projectCurveWavelets

### ** Examples

## generate a noisy curve observed on a regular grid
set.seed( 1 )
n.grid <- 1000
x <- seq( 2, 8, length=n.grid )
sigma.epsilon1 <- 2
sigma.epsilon2 <- 2.5
sigma.epsilon3 <- 3
sigma.epsilon4 <- 1
epsilon <- rnorm( 1000, sd=rep( c( sigma.epsilon1,
sigma.epsilon2, sigma.epsilon3, sigma.epsilon4 ),
rep( 250, 4 ) ) )
y <- x*sin( 3*x ) + 0.3*x^2 + epsilon

## project on wavelet basis with soft universal thresholding
## of the wavelet coefficients
wave <- projectCurveWavelets( x, y, type="soft", policy="universal" )

## plot wavelet reconstruction of the curve
## Not run: 
##D x.norm <- ( x - min( x ) ) / ( max( x ) - min( x ) )
##D plot( x.norm, y )
##D lines( wave$x.grid, wave$y.wavelet, col=2, lwd=3 )
## End(Not run)

## inspect wavelet coefficients
wave.coeffs <- wave$coefficients
print( length( wave.coeffs ) )  ## 1023 coefficients
print( sum( wave.coeffs != 0 ) )  ## only 12 are non-zero



