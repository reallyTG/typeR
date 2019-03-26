library(SongEvo)


### Name: mod.val
### Title: Model validation
### Aliases: mod.val

### ** Examples

### See vignette for an example that uses all functions in SongEvo.

#Parameterize SongEvo with initial song data from Schooner Bay, CA in 1969, and
#then compare simulated data to target (i.e. observed) data in 2005.

data("song.data")
data("glo.parms")

list2env(glo.parms, globalenv()) 
#Prepare initial song data for Schooner Bay.
starting.trait <- subset(song.data, Population=="Schooner" & Year==1969)$Trill.FBW
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait), 
                                           mean=mean(starting.trait), 
                                           sd=sd(starting.trait)))
init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

#Specify and call SongEvo() with validation data
iteration <- 5
years <- 36
timestep <- 1
terr.turnover <- 0.5
SongEvo2 <- SongEvo(init.inds = init.inds,
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
                    mate.comp = TRUE, 
                    prin = TRUE,
                    all=FALSE)

#Specify and call mod.val
ts <- 36
target.data <- subset(song.data, Population=="Schooner" & Year==2005)$Trill.FBW
mod.val1 <- mod.val(summary.results=SongEvo2$summary.results, ts=ts, target.data=target.data)

## No test: 
#Plot results from `mod.val()`
plot(SongEvo2$summary.results[1, , "trait.pop.mean"], 
     xlab="Year", ylab="Bandwidth (Hz)", xaxt="n", type="n", 
     xlim=c(-0.5, 36.5), ylim=range(SongEvo2$summary.results[, , "trait.pop.mean"], na.rm=TRUE))
	for(p in 1:iteration){
		lines(SongEvo2$summary.results[p, , "trait.pop.mean"], col="light gray")
		}
freq.mean <- apply(SongEvo2$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))
#Plot 95% quantiles 
quant.means <- apply (SongEvo2$summary.results[, , "trait.pop.mean"], MARGIN=2, 
                      quantile, probs=c(0.95, 0.05), R=600, na.rm=TRUE)
lines(quant.means[1,], col="blue", lty=2)
lines(quant.means[2,], col="blue", lty=2)
#plot mean and CI for historic songs.  
 #plot original song values
library("boot")
sample.mean <- function(d, x) {
	mean(d[x])
}
boot_hist <- boot(starting.trait, statistic=sample.mean, R=100)
ci.hist <- boot.ci(boot_hist, conf=0.95, type="basic")
low <- ci.hist$basic[4]
high <- ci.hist$basic[5]
points(0, mean(starting.trait), pch=20, cex=0.6, col="black")
library("Hmisc")
errbar(x=0, y=mean(starting.trait), high, low, add=TRUE)
 #text and arrows
text(x=5, y=2720, labels="Historical songs", pos=1)
arrows(x0=5, y0=2750, x1=0.4, y1=mean(starting.trait), length=0.1)
 #plot current song values
library("boot")
sample.mean <- function(d, x) {
	mean(d[x])
}
boot_curr <- boot(target.data, statistic=sample.mean, R=100)
ci.curr <- boot.ci(boot_curr, conf=0.95, type="basic")
low <- ci.curr$basic[4]
high <- ci.curr$basic[5]
points(years, mean(target.data), pch=20, cex=0.6, col="black")
library("Hmisc")
errbar(x=years, y=mean(target.data), high, low, add=TRUE)
 #text and arrows
text(x=25, y=3100, labels="Current songs", pos=3)
arrows(x0=25, y0=3300, x1=36, y1=mean(target.data), length=0.1)
## End(No test)



