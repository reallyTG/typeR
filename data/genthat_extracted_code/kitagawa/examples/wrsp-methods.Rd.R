library(kitagawa)


### Name: wrsp-methods
### Title: Generic methods for objects with class "wrsp".
### Aliases: wrsp-methods wrsp as.data.frame.wrsp data.frame.wrsp
###   print.wrsp summary.wrsp print.summary.wrsp lines.wrsp points.wrsp
###   plot.wrsp kitplot kitplot.wrsp

### ** Examples

W <- well_response(1:10, T.=1, S.=1, Vw.=1, Rs.=1, Ku.=1, B.=1)
str(W)
print(W)
print(summary(W))
#
# Plot the response
plot(rnorm(10), xlim=c(-1,11), ylim=c(-2,2))
lines(W)
lines(W, "phs", col="red")
points(W)
points(W, "phs")
#
Wdf <- as.data.frame(W)
plot(Mod(wellresp) ~ omega, Wdf) # amplitude
plot(Arg(wellresp) ~ omega, Wdf) # phase
#
# or use the builtin method plot.wrsp
plot(W)
# change limits:
plot(W, xlims=c(-1,1), ylims=list(amp=c(5,8), phs=185*c(-1,1)))



