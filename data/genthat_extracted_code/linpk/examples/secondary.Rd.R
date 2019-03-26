library(linpk)


### Name: secondary
### Title: Derive secondary PK parameters.
### Aliases: secondary

### ** Examples

t.obs <- seq(0, 24*4, 0.1)
y <- pkprofile(t.obs, cl=0.25, vc=5, ka=1, dose=list(t.dose=0, amt=1, addl=6, ii=12))
secondary(y)
secondary(y, 0, 48)
secondary(y, 0, Inf)
sum(secondary(y)$AUC)  # Same as above
plot(y)
with(secondary(y), points(Tmax, Cmax, pch=19, col="blue"))
with(secondary(y), points(Tmin, Cmin, pch=19, col="red"))
with(secondary(y), points(From, Ctrough, pch=19, col="green"))
with(secondary(y), points(From + 6, Cave, pch=19, col="purple", cex=2))




