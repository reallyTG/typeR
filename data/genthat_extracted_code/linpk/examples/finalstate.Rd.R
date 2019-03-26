library(linpk)


### Name: finalstate
### Title: Get the final state or time of a PK profile.
### Aliases: finalstate finaltime

### ** Examples

# Administer a dose at time 0 and a second dose using the final state
# from the first dose (at 12h) as the initial state for the second dose.
t.obs <- seq(0, 12, 0.1)
y <- pkprofile(t.obs, cl=0.25, vc=5, ka=1, dose=list(t.dose=0, amt=1))
finalstate(y)
y2 <- pkprofile(t.obs, cl=0.25, vc=5, ka=1, dose=list(t.dose=0, amt=1), initstate=finalstate(y))
plot(y, xlim=c(0, 24), ylim=c(0, max(y2)), col="blue")  # First dose
lines(t.obs+12, y2, col="red")                          # Second dose

# Add a vertical line to show where the first profile ends.
abline(v=finaltime(y), col="gray75", lty=2)



