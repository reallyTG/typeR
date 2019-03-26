library(MortalityTables)


### Name: mortalityTable.period-class
### Title: Class mortalityTable.period - Period life tables
### Aliases: mortalityTable.period-class mortalityTable.period

### ** Examples

linTable = mortalityTable.period(name="linear mortality", ages = 0:50, deathProbs = 0:50/50)
constTable = mortalityTable.period(name="const. mortality", ages = 0:50,
                                   deathProbs = c(rep(0.1, 50), 1))
plot(linTable, constTable, title="Comparison of linear and constand death probabilities")

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
plot(obsTable, title = "Observed death probabilities")




