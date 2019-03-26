library(vcd)


### Name: Trucks
### Title: Truck Accidents Data
### Aliases: Trucks
### Keywords: datasets

### ** Examples

library(MASS)
data("Trucks")
tab <- xtabs(Freq ~ period + collision + light + parked, data = Trucks)
loglm(~ (collision + period) * parked * light, data = tab)
doubledecker(collision ~ parked + light + period, data = tab)
cotabplot(tab, panel = cotab_coindep)



