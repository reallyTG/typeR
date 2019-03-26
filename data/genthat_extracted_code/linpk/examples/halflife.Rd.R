library(linpk)


### Name: halflife
### Title: Half-lives of a linear PK system.
### Aliases: halflife

### ** Examples

y <- pkprofile(0, cl=0.25, vc=5, ka=1.1)
halflife(y)
log(2)/1.1

y <- pkprofile(0, cl=0.25, vc=5, ka=0.01)  # Flip-flop kinetics
halflife(y)
log(2)/0.01

# Three-compartment model
y <- pkprofile(0, cl=2, vc=10, q=c(0.5, 0.3), vp=c(30, 40))
halflife(y)

# The terminal half-life can be used to obtain the terminal slope of the
# concentration-time curve on the semi-log scale:
t.obs <- seq(0, 36, 0.1)
y <- pkprofile(t.obs, cl=0.25, vc=5, ka=1, dose=list(t.dose=0, amt=1))
plot(log2(y))
abline(-2.247927, -1/halflife(y)[1], col=adjustcolor("blue", 0.2), lwd=12)




