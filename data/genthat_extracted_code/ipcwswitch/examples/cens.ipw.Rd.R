library(ipcwswitch)


### Name: cens.ipw
### Title: Censoring patient initiating the other arm treatment and
###   building a treatment censoring indicator cens
### Aliases: cens.ipw

### ** Examples

# To obtain the times parameter, we can apply the timesTokeep function on the same
# dataframe in the wide format
kept.t <- timesTokeep(toydata, id = "id",
tstart = "randt", tstop = "lastdt",
mes.cov = list(c("ps1", "ps2", "ps3")),
time.cov = list(c("randt", "dt2", "dt3")))
# Now, we can build the long format
toy.long <- wideToLongTDC(data = toydata, id = "id",
tstart = "randt", tstop = "lastdt", event = "status",
bas.cov = c("age", "arm", "swtrtdt"),
mes.cov = list(TDconf = c("ps1", "ps2", "ps3")),
time.cov = list(c("randt", "dt2", "dt3")),
times = kept.t[[1]])
# Put dates in numeric format with tstart at 0
toy.long$tstart <- as.numeric(toy.long$tstart)
toy.long$tstop <- as.numeric(toy.long$tstop)
toy.long$swtrtdt <- as.numeric(toy.long$swtrtdt)
tabi <- split(toy.long, toy.long$id)
L.tabi   <- length(tabi)
tablist <- lapply(1:L.tabi, function(i){
    refstart <- tabi[[i]]$tstart[1]
    tabi[[i]]$tstart  <- tabi[[i]]$tstart - refstart
    tabi[[i]]$tstop <- tabi[[i]]$tstop - refstart
    tabi[[i]]$swtrtdt <- tabi[[i]]$swtrtdt - refstart
    return(tabi[[i]])
    })
    toy.long <- do.call( rbind, tablist )
# Patients are censored when initiating the other arm treatment, that is, at time swtrtdt
toy.long2 <- cens.ipw(toy.long, id = "id", tstart = "tstart", tstop = "tstop",
event = "event", arm = "arm",
realtrt = FALSE, censTime ="swtrtdt")
# Before censoring:
toy.long
# Ater censoring:
toy.long2



