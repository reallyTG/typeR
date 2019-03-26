library(not)


### Name: not
### Title: Narrowest-Over-Threshold Change-Point Detection
### Aliases: not not.default

### ** Examples

# **** Piecewisce-constant mean with Gaussian noise.
# *** signal
pcws.const.sig <- c(rep(0, 100), rep(1,100))
# *** data vector
x <- pcws.const.sig + rnorm(100)
# *** identify potential locations of the change-points
w <- not(x, contrast = "pcwsConstMean") 
# *** some examples of how the w object can be used
plot(w)
plot(residuals(w))
plot(predict(w))
# *** this is how to extract the change-points
fo <- features(w)
fo$cpt

# **** Piecewisce-constant mean with a heavy-tailed noise.
# *** data vector, signal the same as in the previous example, but heavy tails
x <- pcws.const.sig + rt(100, 3) 
# *** identify potential locations of the change-points, 
# using a contrast taylored to heavy-tailed data
w <- not(x, contrast = "pcwsConstMeanHT") 
plot(w)

# **** Piecewisce-constant mean and piecewise-constant variance
# *** signal's standard deviation
pcws.const.sd <- c(rep(2, 50), rep(1,150))
# *** data vector with pcws-const mean and variance
x <- pcws.const.sig + pcws.const.sd * rnorm(100)
# *** identify potential locations of the change-points in this model
w <- not(x, contrast = "pcwsConstMeanVar") 
# *** extracting locations of the change-points
fo <- features(w)
fo$cpt

# **** Piecewisce-linear coninuous mean
# *** signal with a change in slope
pcws.lin.cont.sig <- cumsum(c(rep(-1/50, 100), rep(1/50,100)))
# *** data vector 
x <- pcws.lin.cont.sig +  rnorm(100)
# *** identify potential locations of the change-points in the slope coefficient
w <- not(x, contrast = "pcwsLinContMean") 
# *** ploting the results
plot(w)
# *** location(s) of the change-points
fo <- features(w)
fo$cpt

# **** Piecewisce-linear mean with jumps
# *** signal with a change in slope and jumpe
pcws.lin.sig <- pcws.lin.cont.sig + pcws.const.sig
# *** data vector 
x <- pcws.lin.sig +  rnorm(100)
# *** identify potential locations of the change-points in the slope coefficient and the intercept
w <- not(x, contrast = "pcwsLinMean") 
# *** ploting the results
plot(w)
# *** location(s) of the change-points
fo <- features(w)
fo$cpt

# **** Piecewisce-quadratic mean with jumps
# *** Piecewise-quadratic signal
pcws.quad.sig <- 2*c((1:50)^2 /1000, rep(2, 100), 1:50 / 50 )
# *** data vector 
x <- pcws.quad.sig +  rnorm(100)
# *** identify potential locations of the change-points in the slope coefficient and the intercept
w <- not(x, contrast = "pcwsQuadMean") 
# *** ploting the results
plot(w)
# *** location(s) of the change-points
fo <- features(w)
fo$cpt



