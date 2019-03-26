library(surveillance)


### Name: twinstim_simulation
### Title: Simulation of a Self-Exciting Spatio-Temporal Point Process
### Aliases: simEpidataCS simulate.twinstim
### Keywords: datagen models

### ** Examples

data("imdepi", "imdepifit")

## load borders of Germany's districts (originally obtained from the
## Bundesamt fuer Kartographie und Geodaesie, Frankfurt am Main, Germany,
## www.geodatenzentrum.de), simplified by the "modified Visvalingam"
## algorithm (level=6.6%) using MapShaper.org (v. 0.1.17):
load(system.file("shapes", "districtsD.RData", package="surveillance"))
plot(districtsD)
plot(stateD, add=TRUE, border=2, lwd=2)
# 'stateD' was obtained as 'rgeos::gUnaryUnion(districtsD)'

## simulate 2 realizations (during a VERY short period -- for speed)
## considering events from data(imdepi) before t=31 as prehistory
mysims <- simulate(imdepifit, nsim=2, seed=1, data=imdepi,
                   tiles=districtsD, newcoef=c("e.typeC"=-1),
                   t0=31, T=61, simplify=TRUE)
## Don't show: 
    ## check construction and selection from "simEpidataCSlist"
    local({
        mysim_from_list <- mysims[[1]]
        mysim_single <- eval("[[<-"(attr(mysims, "call"), "nsim", 1))
        mysim_from_list$runtime <- mysim_single$runtime <- NULL
        stopifnot(all.equal(mysim_single, mysim_from_list,
                            check.attributes = FALSE))
    })
## End(Don't show)

## extract the second realization -> object of class simEpidataCS
mysims
mysim2 <- mysims[[2]]
summary(mysim2)
plot(mysim2, aggregate="space")

## plot both epidemics using the plot-method for simEpidataCSlist's
plot(mysims, aggregate="time", by=NULL)


if (surveillance.options("allExamples")) {
### compare the observed _cumulative_ number of cases during the
### first 90 days to 20 simulations from the fitted model
### (performing these simulations takes about 30 seconds)

sims <- simulate(imdepifit, nsim=20, seed=1, data=imdepi, t0=0, T=90,
                 tiles=districtsD, simplify=TRUE)

## extract cusums
getcsums <- function (events) {
    tapply(events$time, events@data["type"],
           function (t) cumsum(table(t)), simplify=FALSE)
}
csums_observed <- getcsums(imdepi$events)
csums_simulated <- lapply(sims$eventsList, getcsums)

## plot it
plotcsums <- function (csums, ...) {
    mapply(function (csum, ...) lines(as.numeric(names(csum)), csum, ...),
           csums, ...)
    invisible()
}
plot(c(0,90), c(0,35), type="n", xlab="Time [days]",
     ylab="Cumulative number of cases")
plotcsums(csums_observed, col=c(2,4), lwd=3)
legend("topleft", legend=levels(imdepi$events$type), col=c(2,4), lwd=1)
invisible(lapply(csums_simulated, plotcsums,
                 col=scales::alpha(c(2,4), alpha=0.5)))
}


## Not run: 
##D 
##D ### Experimental code to generate 'nsim' simulations of 'nm2add' months
##D ### beyond the observed time period:
##D nm2add <- 24
##D nsim <- 5
##D ### With these settings, simulations will take about 30 seconds.
##D ### The events still infective by the end of imdepi$stgrid will be used
##D ### as the prehistory for the continued process.
##D 
##D origT <- tail(imdepi$stgrid$stop, 1)
##D ## create a time-extended version of imdepi
##D imdepiext <- local({
##D     ## first we have to expand stgrid (assuming constant "popdensity")
##D     g <- imdepi$stgrid
##D     g$stop <- g$BLOCK <- NULL
##D     gadd <- data.frame(start=rep(seq(origT, by=30, length.out=nm2add),
##D                                  each=nlevels(g$tile)),
##D                        g[rep(seq_len(nlevels(g$tile)), nm2add), -1])
##D     ## now create an "epidataCS" using this time-extended stgrid
##D     as.epidataCS(events=imdepi$events,  # the replacement warnings are ok
##D                  W=imdepi$W, qmatrix=imdepi$qmatrix,
##D                  stgrid=rbind(g, gadd), T=max(gadd$start) + 30)
##D })
##D newT <- tail(imdepiext$stgrid$stop, 1)
##D 
##D ## simulate beyond the original period
##D simsext <- simulate(imdepifit, nsim=nsim, seed=1, t0=origT, T=newT,
##D                     data=imdepiext, tiles=districtsD, simplify=TRUE)
##D 
##D ## Aside to understand the note from checking events and tiles:
##D # marks(imdepi)["636",]  # tile 09662 is attributed to this event, but:
##D # plot(districtsD[c("09678","09662"),], border=1:2, lwd=2, axes=TRUE)
##D # points(imdepi$events["636",])
##D ## this mismatch is due to polygon simplification
##D 
##D ## plot the observed and simulated event numbers over time
##D plot(imdepiext, breaks=c(unique(imdepi$stgrid$start),origT),
##D      cumulative=list(maxat=330))
##D for (i in seq_along(simsext$eventsList))
##D     plot(simsext[[i]], add=TRUE, legend.types=FALSE,
##D          breaks=c(unique(simsext$stgrid$start),newT),
##D          subset=!is.na(source),  # have to exclude the events of the prehistory
##D          cumulative=list(offset=c(table(imdepi$events$type)), maxat=330, axis=FALSE),
##D          border=NA, density=0)  # no histogram
##D abline(v=origT, lty=2, lwd=2)
##D 
## End(Not run)



