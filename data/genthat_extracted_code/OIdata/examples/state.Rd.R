library(OIdata)


### Name: state
### Title: State-level data
### Aliases: state
### Keywords: datasets state United States crime energy

### ** Examples

data(state)
mapvar(state$unempl, state$abbr, 3:1, Legend="Unemployment (%)")

mapvar(state$soc_sec, state$abbr, 1:3, Legend="Social Security (%)")

DC         <- state$state == "District of Columbia"
murder     <- state$murder
murder[DC] <- NA
mapvar(murder, state$abbr, c(3,2,2), Legend="Murders per 100k")

mapvar(state$nuclear, state$abbr, c(2,3,2), Legend="Nuclear Energy (%)")



