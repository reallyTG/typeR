library(oce)


### Name: setFlags,ctd-method
### Title: Set data-quality flags within a ctd object
### Aliases: setFlags,ctd-method

### ** Examples

library(oce)
# Example 1: Range-check salinity
data(ctdRaw)
## Salinity and temperature range checks
qc <- ctdRaw
# Initialize flags to 2, meaning good data in the default
# scheme for handleFlags(ctd).
qc <- initializeFlags(qc, "salinity", 2)
qc <- initializeFlags(qc, "temperature", 2)
# Flag bad salinities as 4
oddS <- with(qc[["data"]], salinity < 25 | 40 < salinity)
qc <- setFlags(qc, name="salinity", i=oddS, value=4)
# Flag bad temperatures as 4
oddT <- with(qc[["data"]], temperature < -2 | 40 < temperature)
qc <- setFlags(qc, name="temperature", i=oddT, value=4)
# Compare results in TS space
par(mfrow=c(2, 1))
plotTS(ctdRaw)
plotTS(handleFlags(qc, flags=list(1, 3:9)))

# Example 2: Interactive flag assignment based on TS plot, using
# WHP scheme to define 'acceptable' and 'bad' codes
## Not run: 
##D options(eos="gsw")
##D data(ctd)
##D qc <- ctd
##D qc <- initializeFlagScheme(qc, "WHP CTD")
##D qc <- initializeFlags(qc, "salinity", 2)
##D Sspan <- diff(range(qc[["SA"]]))
##D Tspan <- diff(range(qc[["CT"]]))
##D n <- length(qc[["SA"]])
##D par(mfrow=c(1, 1))
##D plotTS(qc, type="o")
##D message("Click on bad points; quit by clicking to right of plot")
##D for (i in seq_len(n)) {
##D     xy <- locator(1)
##D     if (xy$x > par("usr")[2])
##D         break
##D     i <- which.min(abs(qc[["SA"]] - xy$x)/Sspan + abs(qc[["CT"]] - xy$y)/Tspan)
##D     qc <- setFlags(qc, "salinity", i=i, value=4)
##D     qc <- handleFlags(qc, flags=list(salinity=4))
##D     plotTS(qc, type="o")
##D }
## End(Not run)




