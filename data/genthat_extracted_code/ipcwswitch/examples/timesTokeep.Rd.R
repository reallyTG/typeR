library(ipcwswitch)


### Name: timesTokeep
### Title: Function to keep all event times
### Aliases: timesTokeep

### ** Examples

kept.t <- timesTokeep(toydata, id = "id",
tstart = "randt", tstop = "lastdt",
mes.cov = list(c("ps1", "ps2", "ps3")),
time.cov = list(c("randt", "dt2", "dt3")))
# For example, for patient id=3, to obtain the kept times in Date format:
kept.t[[1]][[3]]
# To obtain the kept times in numeric format:
kept.t[[2]][[3]]



