library(simboot)


### Name: sbdiv
### Title: Perform simultaneous confidence intervals or adjusted p-values
###   for the Shannon and the Simpson index.
### Aliases: sbdiv
### Keywords: htest

### ** Examples

## For plots of the datasets see the help files for the data sets.

## First dataset
data(predatGM)

## structure of data
str(predatGM)

## remove block variable
datspec_1 <- predatGM[, -1]
str(datspec_1)

## Order of factorial variable
datspec_1$Variety

## argument base = 1 uses GM as control group. Not directly executable
## due to intensive computing time
# sbdiv(X = datspec_1[, 2:length(datspec_1)], f = datspec_1[, 1], theta =
# "Shannon", type = "Dunnett", method = "WYht", conf.level = 0.95,
# alternative = "two.sided", R = 2000, base = 1)

## Directly executable but senseless value for boot steps R
sbdiv(X = datspec_1[, 2:length(datspec_1)], f = datspec_1[, 1], theta =
"Shannon", type = "Dunnett", method = "WYht", conf.level = 0.95,
alternative = "two.sided", R = 100, base = 1)


## Second dataset
data(saproDipGM)

## structure
str(saproDipGM)

## remove block variable
datspec_2 <- saproDipGM[, -1]
str(datspec_2)

## Order of factor variable
datspec_2$Variety

## argument base = 2 uses Ins as control group. Not directly executable
## due to intensive computing time
# sbdiv(X = datspec_2[, 2:length(datspec_2)], f = datspec_2[, 1], theta =
# "Shannon", type = "Dunnett", method = "rpht", conf.level = 0.95,
# alternative = "two.sided", R = 2000, base = 2)

## Directly executable but senseless value for boot steps R
sbdiv(X = datspec_2[, 2:length(datspec_2)], f = datspec_2[, 1], theta =
"Shannon", type = "Dunnett", method = "rpht", conf.level = 0.95,
alternative = "two.sided", R = 100, base = 2)




