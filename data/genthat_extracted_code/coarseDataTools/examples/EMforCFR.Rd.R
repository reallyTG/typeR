library(coarseDataTools)


### Name: EMforCFR
### Title: A function to estimate the relative case fatality ratio when
###   reporting rates are time-varying and deaths are lagged because of
###   survival time.
### Aliases: EMforCFR
### Keywords: case coarse data disease fatality incomplete infectious ratio

### ** Examples

## This is code from the CFR vignette provided in the documentation.

data(simulated.outbreak.deaths)
min.cases <- 10
N.1 <- simulated.outbreak.deaths[1:60, "N"]
N.2 <- simulated.outbreak.deaths[61:120, "N"]
first.t <- min(which(N.1 > min.cases & N.2 > min.cases))
last.t <- max(which(N.1 > min.cases & N.2 > min.cases))
idx.for.Estep <- first.t:last.t
new.times <- 1:length(idx.for.Estep)
simulated.outbreak.deaths <- cbind(simulated.outbreak.deaths, new.times = NA)
simulated.outbreak.deaths[c(idx.for.Estep, idx.for.Estep + 60), "new.times"] <- rep(new.times, + 2)
assumed.nu = c(0, 0.3, 0.4, 0.3)
alpha.start <- rep(0, 22)

## caution! this next line may take several minutes (5-10, depanding on
##    the speed of your machine) to run.
## Not run: 
##D cfr.ests <- EMforCFR(assumed.nu = assumed.nu,
##D                               alpha.start.values = alpha.start,
##D                               full.data = simulated.outbreak.deaths,
##D                               verb = FALSE,
##D                               SEM.var = TRUE,
##D                               max.iter = 500,
##D                               tol = 1e-05)
## End(Not run)



