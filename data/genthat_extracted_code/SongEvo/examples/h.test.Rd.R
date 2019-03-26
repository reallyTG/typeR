library(SongEvo)


### Name: h.test
### Title: Test hypotheses about song evolution
### Aliases: h.test

### ** Examples

### See vignette for an example that uses all functions in SongEvo.

#Prepare initial song data for Bear Valley.
data("song.data")
data("glo.parms")
years=2005-1969
iteration=5
timestep=1
n.territories <- glo.parms$n.territories
starting.trait <- subset(song.data, Population=="Bear Valley" & Year==1969)$Trill.FBW
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait),
                                           mean=mean(starting.trait), sd=sd(starting.trait)))
init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

#Specify and call SongEvo() with test data

SongEvo3 <- with(glo.parms,SongEvo(init.inds = init.inds,
                    iteration = iteration,
                    steps = years,
                    timestep = timestep,
                    n.territories = n.territories,
                    terr.turnover = terr.turnover,
                    learning.method = "integrate",
                    integrate.dist = 50,
                    learning.error.d = learning.error.d,
                    learning.error.sd = learning.error.sd,
                    mortality.a = mortality.a,
                    mortality.j = mortality.j,
                    lifespan = NA,
                    phys.lim.min = phys.lim.min,
                    phys.lim.max = phys.lim.max,
                    male.fledge.n.mean = male.fledge.n.mean,
                    male.fledge.n.sd = male.fledge.n.sd,
                    male.fledge.n = male.fledge.n,
                    disp.age = disp.age,
                    disp.distance.mean = disp.distance.mean,
                    disp.distance.sd = disp.distance.sd,
                    mate.comp = FALSE,
                    prin = FALSE,
                    all = FALSE))

#Specify and call `h.test()`
ts=years
target.data <- subset(song.data, Population=="Bear Valley" & Year==2005)$Trill.FBW
h.test1 <- h.test(summary.results=SongEvo3$summary.results, ts=ts, target.data=target.data)

# The output data list includes two measures of accuracy: the proportion of
# observed points that fall within the confidence intervals of the simulated
# data and the residuals between simulated and observed population trait means.
# Precision is measured as the residuals between simulated and observed
# population trait variances.

# Eighty percent of the observed data fell within the central 95% of the
# simulated values, providing support for the hypothesis that cultural drift as
# described in this model is sufficient to describe the evolution of trill
# frequency bandwidth in this population.
h.test1

## Not run: 
##D #Plot simulated data in relation to measured data.
##D #Plot
##D plot(SongEvo3$summary.results[1, , "trait.pop.mean"], 
##D      xlab="Year", ylab="Bandwidth (Hz)", xaxt="n", type="n",
##D      xlim=c(-0.5, 35.5), ylim=range(SongEvo3$summary.results[, , "trait.pop.mean"], na.rm=TRUE))
##D 	for(p in 1:iteration){
##D 		lines(SongEvo3$summary.results[p, , "trait.pop.mean"], col="light gray")
##D 		}
##D freq.mean <- apply(SongEvo3$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
##D lines(freq.mean, col="blue")
##D axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))
##D #Plot 95% quantiles (which are similar to credible intervals)
##D quant.means <- apply (SongEvo3$summary.results[, , "trait.pop.mean"], MARGIN=2, 
##D                       quantile, probs=c(0.95, 0.05), R=600, na.rm=TRUE)
##D lines(quant.means[1,], col="blue", lty=2)
##D lines(quant.means[2,], col="blue", lty=2)
##D  #plot original song values
##D library("boot")
##D sample.mean <- function(d, x) {
##D 	mean(d[x])
##D }
##D boot_hist <- boot(starting.trait, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
##D ci.hist <- boot.ci(boot_hist, conf=0.95, type="basic")
##D low <- ci.hist$basic[4]
##D high <- ci.hist$basic[5]
##D points(0, mean(starting.trait), pch=20, cex=0.6, col="black")
##D library("Hmisc")
##D errbar(x=0, y=mean(starting.trait), high, low, add=TRUE)
##D  #plot current song values
##D points(rep(ts, length(target.data)), target.data)
##D library("boot")
##D sample.mean <- function(d, x) {
##D 	mean(d[x])
##D }
##D boot_curr <- boot(target.data, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
##D ci.curr <- boot.ci(boot_curr, conf=0.95, type="basic")
##D low <- ci.curr$basic[4]
##D high <- ci.curr$basic[5]
##D points(years, mean(target.data), pch=20, cex=0.6, col="black")
##D library("Hmisc")
##D errbar(x=years, y=mean(target.data), high, low, add=TRUE)
##D  #text and arrows
##D text(x=11, y=2850, labels="Historical songs", pos=1)
##D arrows(x0=5, y0=2750, x1=0.4, y1=mean(starting.trait), length=0.1)
##D text(x=25, y=2900, labels="Current songs", pos=1)
##D arrows(x0=25, y0=2920, x1=years, y1=mean(target.data), length=0.1)
## End(Not run)



