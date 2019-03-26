library(oce)


### Name: handleFlags,ctd-method
### Title: Handle Flags in CTD Objects
### Aliases: handleFlags,ctd-method

### ** Examples

library(oce)
data(section)
stn <- section[["station", 100]]
# 1. Default: anything not flagged as 2 is set to NA, to focus
# solely on 'good', in the World Hydrographic Program scheme.
STN1 <- handleFlags(stn, flags=list(c(1, 3:9)))
data.frame(old=stn[["salinity"]], new=STN1[["salinity"]], salinityFlag=stn[["salinityFlag"]])

# 2. Use bottle salinity, if it is good and ctd is bad
replace <- 2 == stn[["salinityBottleFlag"]] && 2 != stn[["salinityFlag"]]
S <- ifelse(replace, stn[["salinityBottle"]], stn[["salinity"]])
STN2 <- oceSetData(stn, "salinity", S)

# 3. Use smoothed TS relationship to nudge questionable data.
f <- function(x) {
  S <- x[["salinity"]]
  T <- x[["temperature"]]
  df <- 0.5 * length(S) # smooths a bit
  sp <- smooth.spline(T, S, df=df)
  0.5 * (S + predict(sp, T)$y)
}
par(mfrow=c(1,2))
STN3 <- handleFlags(stn, flags=list(salinity=c(1,3:9)), action=list(salinity=f))
plotProfile(stn, "salinity", mar=c(3, 3, 3, 1))
p <- stn[["pressure"]]
par(mar=c(3, 3, 3, 1))
plot(STN3[["salinity"]] - stn[["salinity"]], p, ylim=rev(range(p)))




