library(kitagawa)


### Name: owrsp-methods
### Title: Generic methods for objects with class "owrsp".
### Aliases: owrsp-methods owrsp as.data.frame.owrsp data.frame.owrsp
###   print.owrsp summary.owrsp print.summary.owrsp lines.owrsp
###   points.owrsp plot.owrsp

### ** Examples

S. <- 1e-5  	# Storativity [nondimensional]
T. <- 1e-4		# Transmissivity [m**2 / s]
frq <- 1/(1:200)
# Defaults to the Rojstaczer formulation
W <- open_well_response(frq, T. = T., S. = S., Rs. = 0.12, freq.units="Hz")
# (warning message about missing 'z')
W <- open_well_response(frq, T. = T., S. = S., Rs. = 0.12, freq.units="Hz", z=1)
str(W)
print(W)
print(summary(W))
plot(rnorm(10), xlim=c(-1,11), ylim=c(-2,2))
lines(W)
lines(W, "phs", col="red")
points(W)
points(W, "phs")
#
Wdf <- as.data.frame(W)
plot(Mod(wellresp) ~ omega, Wdf) # amplitude
plot(Arg(wellresp) ~ omega, Wdf) # phase
plot(W)
# change limits:
plot(W, xlims=c(-4,0), ylims=list(amp=c(-7,-3), phs=185*c(-1,1)))



