library(MortalityTables)


### Name: whittaker.mortalityTable
### Title: Smooth a life table using the Whittaker-Henderson method,
###   intepolation possibly missing values
### Aliases: whittaker.mortalityTable

### ** Examples

# A sample observation table with exposures and raw probabilities
obsTable = mortalityTable.period(
    name = "trivial observed table",
    ages = 0:15,
    deathProbs = c(
        0.0072, 0.00212, 0.00081, 0.0005, 0.0013,
        0.001, 0.00122, 0.00142, 0.007, 0.0043,
        0.0058, 0.0067, 0.0082, 0.0091, 0.0075, 0.01),
    exposures = c(
        150, 222, 350, 362, 542,
        682, 1022, 1053, 1103, 1037,
        968, 736, 822, 701, 653, 438))

# Effect of the different parameters
obsTable.smooth = whittaker.mortalityTable(obsTable,
    lambda = 1/10, d = 2, name.postfix = " smoothed (d=2, lambda=1/10)")
obsTable.smooth1 = whittaker.mortalityTable(obsTable,
    lambda = 1, d = 2, name.postfix = " smoothed (d=2, lambda=1)")
obsTable.smooth2 = whittaker.mortalityTable(obsTable,
    lambda = 1/10, d = 3, name.postfix = " smoothed (d=3, lambda=1/10)")
plot(obsTable, obsTable.smooth, obsTable.smooth1, obsTable.smooth2,
    title = "Observed death probabilities")

# Missing values are interpolated from the Whittaker Henderson
obsTable.missing = obsTable
obsTable.missing@deathProbs[c(6,10,11,12)] = NA_real_
obsTable.interpolated = whittaker.mortalityTable(obsTable,
    lambda = 1/10, d = 2, name.postfix = " missing values interpolated")
plot(obsTable.missing, obsTable.interpolated,
    title = "Missing values are automatically interpolated") + geom_point(size = 3)





