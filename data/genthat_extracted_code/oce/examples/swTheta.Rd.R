library(oce)


### Name: swTheta
### Title: Seawater potential temperature
### Aliases: swTheta

### ** Examples

library(oce)
## test value from Fofonoff et al., 1983
expect_equal(36.8818748026, swTheta(40, T90fromT68(40), 10000, 0, eos="unesco"))

# Example from a cross-Atlantic section
data(section)
stn <- section[['station', 70]]
plotProfile(stn, 'theta', ylim=c(6000, 1000))
lines(stn[['temperature']], stn[['pressure']], lty=2)
legend("bottomright", lty=1:2,
       legend=c("potential", "in-situ"),
       bg='white', title="Station 70")




