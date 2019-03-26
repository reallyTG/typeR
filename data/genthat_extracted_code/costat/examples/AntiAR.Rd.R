library(costat)


### Name: AntiAR
### Title: Undo autoreflection action for an EWS object (wd stationary)
### Aliases: AntiAR
### Keywords: math smooth

### ** Examples

#
# Generate example, temporary series
#
x <- rnorm(128)	
#
# Reflect it about its end point
#
x2 <- c(x, rev(x))
#
# Compute EWS estimate
#
x2ews <- ewspec(x2)
#
# Now get bit corresponding to x into object
#
xews <- AntiAR(x2ews$S)



