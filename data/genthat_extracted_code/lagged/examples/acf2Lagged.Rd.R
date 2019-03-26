library(lagged)


### Name: acf2Lagged
### Title: Convert "acf" objects to "Lagged" objects
### Aliases: acf2Lagged
### Keywords: ts

### ** Examples

## using examples from help(acf)
lh_acf <- acf2Lagged(acf(lh))

lh_acf[0:5]
acf(lh, plot = FALSE)$acf[1 + 0:5] # same

acf(ts.union(mdeaths, fdeaths))$acf[15,,]

deaths_mts <- ts.union(mdeaths, fdeaths)
deaths_acf <- acf2Lagged(acf(deaths_mts))
base_acf <- acf(deaths_mts)

deaths_acf[14]
base_acf$acf[1 + 14, , ] # same



