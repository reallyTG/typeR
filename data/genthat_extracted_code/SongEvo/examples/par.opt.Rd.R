library(SongEvo)


### Name: par.opt
### Title: Parameter optimization
### Aliases: par.opt

### ** Examples

### See vignette for an example that uses all functions in SongEvo.

#### Specify and call `par.sens()`

# Here we test the sensitivity of the Acquire a Territory submodel to variation
# in territory turnover rates, ranging from 0.8–1.2 times the published rate
# (40–60% of territories turned over). The call for the par.sens function has a
# format similar to SongEvo. The user specifies the parameter to test and the
# range of values for that parameter. The function currently allows examination
# of only one parameter at a time and requires at least two iterations.
parm <- "terr.turnover"
par.range = seq(from=0.45, to=0.55, by=0.05)
sens.results <- NULL
data("song.data")
data("glo.parms")
years=2005-1969
iteration=5
timestep=1
n.territories <- glo.parms$n.territories
starting.trait <- subset(song.data, Population=="PRBO" & Year==1969)$Trill.FBW
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait),
                                           mean=mean(starting.trait), sd=sd(starting.trait)))
init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

# Now we call the par.sens function with our specifications.
extra_parms <- list(init.inds = init.inds, 
                    timestep = 1, 
                    n.territories = nrow(init.inds), 
                    learning.method = "integrate", 
                    integrate.dist = 0.1, 
                    lifespan = NA, 
                    terr.turnover = 0.5, 
                    mate.comp = FALSE, 
                    prin = FALSE,
                    all = TRUE)
global_parms_key <- which(!names(glo.parms) %in% names(extra_parms))
extra_parms[names(glo.parms[global_parms_key])]=glo.parms[global_parms_key]
par.sens1 <- par.sens(parm = parm, par.range = par.range, 
                      iteration = iteration, steps = years, mate.comp = FALSE, 
                      fixed_parms=extra_parms[names(extra_parms)!=parm], all = TRUE)

#### Prepare current song values
target.data <- subset(song.data, Population=="PRBO" & Year==2005)$Trill.FBW

#### Specify and call `par.opt()`

# Users specify the timestep (“ts”) at which to compare simulated trait values
# to target trait data (“target.data”) and save the results in an object (called
# `par.opt1` here).
ts <- years
par.opt1 <- par.opt(sens.results=par.sens1$sens.results, ts=ts, 
                    target.data=target.data, par.range=par.range)

# Examine results objects (residuals and target match).  
par.opt1$Residuals
par.opt1$Target.match

## No test: 
	
#### Plot results of `par.opt()`
#### Accuracy

  #1. Difference in means.
plot(par.range, par.opt1$Target.match[,1], type="l", 
     xlab="Parameter range", ylab="Difference in means (Hz)")

  #2. Plot proportion contained.
plot(par.range, par.opt1$Prop.contained, type="l", 
     xlab="Parameter range", ylab="Proportion contained")

  #3. Calculate and plot mean and quantiles of residuals of mean trait values.
res.mean.means <- apply(par.opt1$Residuals[, , 1], MARGIN=1, 
                        mean, na.rm=TRUE)
res.mean.quants <- apply (par.opt1$Residuals[, , 1], MARGIN=1, 
                          quantile, probs=c(0.975, 0.025), R=600, na.rm=TRUE)
plot(par.range, res.mean.means, col="orange", 
     ylim=range(par.opt1$Residuals[,,1], na.rm=TRUE), 
     type="b", 
     xlab="Parameter value (territory turnover rate)", 
     ylab="Residual of trait mean (trill bandwidth, Hz)")
points(par.range, res.mean.quants[1,], col="orange")
points(par.range, res.mean.quants[2,], col="orange")
lines(par.range, res.mean.quants[1,], col="orange", lty=2)
lines(par.range, res.mean.quants[2,], col="orange", lty=2)

#### Precision
#Calculate and plot mean and quantiles of residuals of variance of trait values
res.var.mean <- apply(par.opt1$Residuals[, , 2], MARGIN=1, 
                      mean, na.rm=TRUE)
res.var.quants <- apply (par.opt1$Residuals[, , 2], MARGIN=1, 
                         quantile, probs=c(0.975, 0.025), R=600, na.rm=TRUE)
plot(par.range, res.var.mean, col="purple", 
     ylim=range(par.opt1$Residuals[,,2], na.rm=TRUE),
     type="b", 
     xlab="Parameter value (territory turnover rate)", 
     ylab="Residual of trait variance (trill bandwidth, Hz)")
points(par.range, res.var.quants[1,], col="purple")
points(par.range, res.var.quants[2,], col="purple")
lines(par.range, res.var.quants[1,], col="purple", lty=2)
lines(par.range, res.var.quants[2,], col="purple", lty=2)

#### Visual inspection of accuracy and precision: plot trait values for range of parameters
par(mfcol=c(3,2),
    mar=c(4.1, 4.1, 1, 1),
    cex=1.2)
for(i in 1:length(par.range)){
plot(par.sens1$sens.results[ , , "trait.pop.mean", ], 
     xlab="Year", ylab="Bandwidth (Hz)", 
     xaxt="n", type="n", 
     xlim=c(-0.5, years), ylim=range(par.sens1$sens.results[ , , "trait.pop.mean", ], na.rm=TRUE))
	for(p in 1:iteration){
		lines(par.sens1$sens.results[p, , "trait.pop.mean", i], col="light gray")
		}
freq.mean <- apply(par.sens1$sens.results[, , "trait.pop.mean", i], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))
#Plot 95% quantiles
quant.means <- apply (par.sens1$sens.results[, , "trait.pop.mean", i], MARGIN=2, 
                      quantile, probs=c(0.95, 0.05), R=600, na.rm=TRUE)
lines(quant.means[1,], col="blue", lty=2)
lines(quant.means[2,], col="blue", lty=2)
#plot mean and CI for historic songs.  
 #plot original song values
library("boot")
sample.mean <- function(d, x) {
	mean(d[x])
}
boot_hist <- boot(starting.trait, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
ci.hist <- boot.ci(boot_hist, conf=0.95, type="basic")
low <- ci.hist$basic[4]
high <- ci.hist$basic[5]
points(0, mean(starting.trait), pch=20, cex=0.6, col="black")
library("Hmisc")
errbar(x=0, y=mean(starting.trait), high, low, add=TRUE)
 
 #plot current song values
boot_curr <- boot(target.data, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
ci.curr <- boot.ci(boot_curr, conf=0.95, type="basic")
low <- ci.curr$basic[4]
high <- ci.curr$basic[5]
points(years, mean(target.data), pch=20, cex=0.6, col="black")
errbar(x=years, y=mean(target.data), high, low, add=TRUE)
  #plot panel title
text(x=3, y=max(par.sens1$sens.results[ , , "trait.pop.mean", ], na.rm=TRUE)-100, 
     labels=paste("Par = ", par.range[i], sep=""))  
}
## End(No test)



