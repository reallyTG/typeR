## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", tidy = FALSE)

## ----library-------------------------------------------------------------
library(SongEvo)

## ----song.data-----------------------------------------------------------
data("song.data")

## ----global parameters---------------------------------------------------
data("glo.parms")
str(glo.parms)

## ----share with global environment, message=FALSE, warning=FALSE---------
list2env(glo.parms, globalenv())

## ----song data-----------------------------------------------------------
str(song.data)

## ----subset initial song values------------------------------------------
starting.trait <- subset(song.data, Population=="PRBO" & Year==1969)$Trill.FBW

## ----define initial individuals------------------------------------------
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait), 
	mean=mean(starting.trait), sd=sd(starting.trait)))
init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

## ----Specify SongEvo model-----------------------------------------------
iteration <- 10
years <- 36
timestep <- 1
terr.turnover <- 0.5
learning.method <- "integrate"
integrate.dist <- 0.1
lifespan <- NA
mate.comp <- FALSE
prin <- FALSE
all <- TRUE

## ----Call SongEvo model, echo=TRUE---------------------------------------
SongEvo1 <- SongEvo(init.inds = init.inds, iteration = iteration, steps = years,  
	timestep = timestep, n.territories = n.territories, terr.turnover = terr.turnover, 
	learning.method = learning.method, integrate.dist = integrate.dist, 
	learning.error.d = learning.error.d, learning.error.sd = learning.error.sd, 
	mortality.a = mortality.a, mortality.j = mortality.j, lifespan = lifespan, 
	phys.lim.min = phys.lim.min, phys.lim.max = phys.lim.max, 
	male.fledge.n.mean = male.fledge.n.mean, male.fledge.n.sd = male.fledge.n.sd, 
	male.fledge.n = male.fledge.n, disp.age = disp.age, 
	disp.distance.mean = disp.distance.mean, disp.distance.sd = disp.distance.sd, 
	mate.comp = mate.comp, prin = prin, all)

## ----Examine results from SongEvo model----------------------------------
SongEvo1$time

## ----Examine inds--------------------------------------------------------
head(SongEvo1$inds, 5)

## ----Examine summary.results---------------------------------------------
dimnames(SongEvo1$summary.results)

## ----Examine all.inds----------------------------------------------------
head(SongEvo1$all.inds, 5)

## ----Examine population size over time-----------------------------------
plot(SongEvo1$summary.results[1, , "sample.n"], xlab="Year", ylab="Abundance", type="n", 
	xaxt="n", ylim=c(0, max(SongEvo1$summary.results[, , "sample.n"], na.rm=TRUE)))
axis(side=1, at=seq(0, 40, by=5), labels=seq(1970, 2010, by=5))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "sample.n"], col="light gray")
		}
n.mean <- apply(SongEvo1$summary.results[, , "sample.n"], 2, mean, na.rm=TRUE)
lines(n.mean, col="red")

#Plot 95% quantiles
quant.means <- apply (SongEvo1$summary.results[, , "sample.n"], MARGIN=2, quantile, 
	probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="red", lty=2)
lines(quant.means[2,], col="red", lty=2)

## ----Load Hmisc package for plotting functions, message=FALSE, warning=TRUE----
library("Hmisc")

## ----Examine simulated trait evolution-----------------------------------
plot(SongEvo1$summary.results[1, , "trait.pop.mean"], xlab="Year", ylab="Bandwidth (Hz)", 
	xaxt="n", type="n", xlim=c(-0.5, 36), 
	ylim=c(min(SongEvo1$summary.results[, , "trait.pop.mean"], na.rm=TRUE), 
	max(SongEvo1$summary.results[, , "trait.pop.mean"], na.rm=TRUE)))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "trait.pop.mean"], col="light gray")
		}
freq.mean <- apply(SongEvo1$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))

#Plot 95% quantiles
quant.means <- apply (SongEvo1$summary.results[, , "trait.pop.mean"], MARGIN=2, quantile, 
	probs=c(0.95, 0.05), R=600, na.rm=TRUE)
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
errbar(x=0, y=mean(starting.trait), high, low, add=TRUE)
 #text and arrows
text(x=5, y=2720, labels="Historical songs", pos=1)
arrows(x0=5, y0=2750, x1=0.4, y1=mean(starting.trait), length=0.1)

## ----Examine simulated trait variance------------------------------------
 #plot variance for each iteration per year
plot(SongEvo1$summary.results[1, , "trait.pop.variance"], xlab="Year", 
	ylab="Bandwidth Variance (Hz)", type="n", xaxt="n", 
	ylim=c(min(SongEvo1$summary.results[, , "trait.pop.variance"], na.rm=TRUE), 
	max(SongEvo1$summary.results[, , "trait.pop.variance"], na.rm=TRUE)))
axis(side=1, at=seq(0, 40, by=5), labels=seq(1970, 2010, by=5))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "trait.pop.variance"], col="light gray")
		}
n.mean <- apply(SongEvo1$summary.results[, , "trait.pop.variance"], 2, mean, na.rm=TRUE)
lines(n.mean, col="green")

#Plot 95% quantiles
quant.means <- apply (SongEvo1$summary.results[, , "trait.pop.variance"], MARGIN=2, quantile, 
	probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="green", lty=2)
lines(quant.means[2,], col="green", lty=2)

## ----Load packages for making maps, message=FALSE, warning=TRUE----------
library("sp")
library("reshape2")
library("lattice")

## ----Convert data frame from long to wide format-------------------------
all.inds1 <- subset(SongEvo1$all.inds, iteration==1)
w <- dcast(as.data.frame(all.inds1), id ~ timestep, value.var="trait", fill=0)
all.inds1w <- merge(all.inds1, w, by="id")
names(all.inds1w) <- c(names(all.inds1), paste("Ts", seq(1:years), sep=""))

## ----Make color ramp-----------------------------------------------------
rbPal <- colorRampPalette(c('blue','red')) #Create a function to generate a continuous color palette

## ----Plot map------------------------------------------------------------
spplot(all.inds1w[,-c(1:ncol(all.inds1))], as.table=TRUE, 
	cuts=c(0, seq(from=1500, to=4500, by=10)), ylab="", 
	col.regions=c("transparent", rbPal(1000)), 
	#cuts specifies that the first level (e.g. <1500) is transparent.
colorkey=list(
	right=list(
		  fun=draw.colorkey,
		  args=list( 
		  		key=list(
		  		at=seq(1500, 4500, 10),
		  		col=rbPal(1000),
		  		labels=list(
		  		at=c(1500, 2000, 2500, 3000, 3500, 4000, 4500),
		  		labels=c("1500", "2000", "2500", "3000", "3500", "4000", "4500")
		  		)
		  		)
		  		)
		  	)
	)
)

## ----Plot maps without using the spatial data class----------------------
 #Lattice plot (not as a spatial frame)
it1 <- subset(SongEvo1$all.inds, iteration==1)
rbPal <- colorRampPalette(c('blue','red')) #Create a function to generate a continuous color palette
it1$Col <- rbPal(10)[as.numeric(cut(it1$trait, breaks = 10))]
xyplot(it1$y1~it1$x1 | it1$timestep, groups=it1$trait, asp="iso", col=it1$Col, 
	xlab="Longitude", ylab="Latitude")

## ----Specify the par.sens model------------------------------------------
parm <- "terr.turnover"
par.range = seq(from=0.4, to=0.6, by=0.05)
sens.results <- NULL

## ----Call par.sens function, message=FALSE-------------------------------
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

## ----Examine results dimensions------------------------------------------
dimnames(par.sens1$sens.results)

## ----Examine results dimensions 2----------------------------------------
dimnames(par.sens1$sens.results.diff)

## ----plot of range in trait quantiles by year by parameter value---------
 #plot of range in trait quantiles by year by parameter value
plot(1:years, par.sens1$sens.results.diff[1,], ylim=c(min(par.sens1$sens.results.diff, 
	na.rm=TRUE), max(par.sens1$sens.results.diff, na.rm=TRUE)), type="l", 
	ylab="Quantile range (Hz)", xlab="Year", col="transparent", xaxt="n")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))

  #Make a continuous color ramp from gray to black
grbkPal <- colorRampPalette(c('gray','black'))
  
  #Plot a line for each parameter value
for(i in 1:length(par.range)){
lines(1:years, par.sens1$sens.results.diff[i,], type="l", 
	col=grbkPal(length(par.range))[i])
}

  #Plot values from published parameter values
lines(1:years, par.sens1$sens.results.diff[2,], type="l", col="black", lwd=4)

  #Calculate and plot mean and quantiles
quant.mean <- apply(par.sens1$sens.results.diff, 2, mean, na.rm=TRUE)
lines(quant.mean, col="orange")

#Plot 95% quantiles (which are similar to credible intervals)
  #95% quantiles of population means (narrower)
quant.means <- apply (par.sens1$sens.results.diff, MARGIN=2, quantile, 
	probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="orange", lty=2)
lines(quant.means[2,], col="orange", lty=2)

## ----prepare current songs-----------------------------------------------
target.data <- subset(song.data, Population=="PRBO" & Year==2005)$Trill.FBW

## ----Specify and call par.opt()------------------------------------------
ts <- years
par.opt1 <- par.opt(sens.results=par.sens1$sens.results, ts=ts, 
	target.data=target.data, par.range=par.range)

## ----Examine par.opt() results objects, message=FALSE--------------------
par.opt1$Residuals
par.opt1$Target.match

## ----par.opt() difference in means---------------------------------------
plot(par.range, par.opt1$Target.match[,1], type="l", xlab="Parameter range", 
	ylab="Difference in means (Hz)")

## ----par.opt() proportion contained--------------------------------------
plot(par.range, par.opt1$Prop.contained, type="l", xlab="Parameter range", 
	ylab="Proportion contained")

## ----par.opt() residuals of the mean-------------------------------------
res.mean.means <- apply(par.opt1$Residuals[, , 1], MARGIN=1, mean, na.rm=TRUE)
res.mean.quants <- apply (par.opt1$Residuals[, , 1], MARGIN=1, quantile, 
	probs=c(0.975, 0.025), R=600, na.rm=TRUE)
plot(par.range, res.mean.means, col="orange", ylim=c(min(par.opt1$Residuals[,,1], 
	na.rm=TRUE), max(par.opt1$Residuals[,,1], na.rm=TRUE)), type="b", 
	xlab="Parameter value (territory turnover rate)", 
	ylab="Residual of trait mean (trill bandwidth, Hz)")
points(par.range, res.mean.quants[1,], col="orange")
points(par.range, res.mean.quants[2,], col="orange")
lines(par.range, res.mean.quants[1,], col="orange", lty=2)
lines(par.range, res.mean.quants[2,], col="orange", lty=2)

## ----par.opt() residuals of the variance---------------------------------
#Calculate and plot mean and quantiles of residuals of variance of trait values
res.var.mean <- apply(par.opt1$Residuals[, , 2], MARGIN=1, mean, na.rm=TRUE)
res.var.quants <- apply (par.opt1$Residuals[, , 2], MARGIN=1, quantile, 
	probs=c(0.975, 0.025), R=600, na.rm=TRUE)
plot(par.range, res.var.mean, col="purple", 
	ylim=c(min(par.opt1$Residuals[,,2], na.rm=TRUE), 
	max(par.opt1$Residuals[,,2], na.rm=TRUE)), type="b", 
	xlab="Parameter value (territory turnover rate)", 
	ylab="Residual of trait variance (trill bandwidth, Hz)")
points(par.range, res.var.quants[1,], col="purple")
points(par.range, res.var.quants[2,], col="purple")
lines(par.range, res.var.quants[1,], col="purple", lty=2)
lines(par.range, res.var.quants[2,], col="purple", lty=2)

## ----par.opt() visual inspection of simulated data-----------------------
par(mfcol=c(3,2),
    mar=c(2.1, 2.1, 0.1, 0.1),
    cex=0.8)
for(i in 1:length(par.range)){
plot(par.sens1$sens.results[ , , "trait.pop.mean", ], xlab="Year", ylab="Bandwidth (Hz)", 
	xaxt="n", type="n", xlim=c(-0.5, years), 
	ylim=c(min(par.sens1$sens.results[ , , "trait.pop.mean", ], na.rm=TRUE), 
	max(par.sens1$sens.results[ , , "trait.pop.mean", ], na.rm=TRUE)))
	for(p in 1:iteration){
		lines(par.sens1$sens.results[p, , "trait.pop.mean", i], col="light gray")
		}
freq.mean <- apply(par.sens1$sens.results[, , "trait.pop.mean", i], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))

#Plot 95% quantiles
quant.means <- apply (par.sens1$sens.results[, , "trait.pop.mean", i], MARGIN=2, quantile, 
	probs=c(0.95, 0.05), R=600, na.rm=TRUE)
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
library("boot")
sample.mean <- function(d, x) {
	mean(d[x])
}
boot_curr <- boot(target.data, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
ci.curr <- boot.ci(boot_curr, conf=0.95, type="basic")
low <- ci.curr$basic[4]
high <- ci.curr$basic[5]
points(years, mean(target.data), pch=20, cex=0.6, col="black")
library("Hmisc")
errbar(x=years, y=mean(target.data), high, low, add=TRUE)

  #plot panel title
text(x=3, y=max(par.sens1$sens.results[ , , "trait.pop.mean", ], na.rm=TRUE)-100, 
	labels=paste("Par = ", par.range[i], sep=""))  
}

## ----Prepare initial song data for Schooner Bay--------------------------
starting.trait <- subset(song.data, Population=="Schooner" & Year==1969)$Trill.FBW
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait), 
	mean=mean(starting.trait), sd=sd(starting.trait)))

init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)


## ----Specify and call SongEvo() with validation data---------------------
iteration <- 10
years <- 36
timestep <- 1
terr.turnover <- 0.5

SongEvo2 <- SongEvo(init.inds = init.inds, iteration = iteration, steps = years,  
	timestep = timestep, n.territories = n.territories, terr.turnover = terr.turnover, 
	learning.method = learning.method, integrate.dist = integrate.dist, 
	learning.error.d = learning.error.d, learning.error.sd = learning.error.sd, 
	mortality.a = mortality.a, mortality.j = mortality.j, lifespan = lifespan, 
	phys.lim.min = phys.lim.min, phys.lim.max = phys.lim.max, 
	male.fledge.n.mean = male.fledge.n.mean, male.fledge.n.sd = male.fledge.n.sd, 
	male.fledge.n = male.fledge.n, disp.age = disp.age, 
	disp.distance.mean = disp.distance.mean, disp.distance.sd = disp.distance.sd, 
	mate.comp = mate.comp, prin = prin, all)

## ----Specify and call mod.val()------------------------------------------
ts <- 36
target.data <- subset(song.data, Population=="Schooner" & Year==2005)$Trill.FBW
mod.val1 <- mod.val(summary.results=SongEvo2$summary.results, ts=ts, 
	target.data=target.data)

## ----Plot results from mod.val()-----------------------------------------
plot(SongEvo2$summary.results[1, , "trait.pop.mean"], xlab="Year", ylab="Bandwidth (Hz)", 
	xaxt="n", type="n", xlim=c(-0.5, 36.5), 
	ylim=c(min(SongEvo2$summary.results[, , "trait.pop.mean"], na.rm=TRUE), 
	max(SongEvo2$summary.results[, , "trait.pop.mean"], na.rm=TRUE)))
	for(p in 1:iteration){
		lines(SongEvo2$summary.results[p, , "trait.pop.mean"], col="light gray")
		}
freq.mean <- apply(SongEvo2$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))

#Plot 95% quantiles 
quant.means <- apply (SongEvo2$summary.results[, , "trait.pop.mean"], MARGIN=2, quantile, 
	probs=c(0.95, 0.05), R=600, na.rm=TRUE)
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

## ----Prepare initial song data for Bear Valley---------------------------
starting.trait <- subset(song.data, Population=="Bear Valley" & Year==1969)$Trill.FBW
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait), 
	mean=mean(starting.trait), sd=sd(starting.trait)))

init.inds <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <-  round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <-  round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

## ----Specify and call SongEvo() with test data---------------------------
SongEvo3 <- SongEvo(init.inds = init.inds, iteration = iteration, steps = years,  
	timestep = timestep, n.territories = n.territories, terr.turnover = terr.turnover, 
	learning.method = learning.method, integrate.dist = integrate.dist, 
	learning.error.d = learning.error.d, learning.error.sd = learning.error.sd, 
	mortality.a = mortality.a, mortality.j = mortality.j, lifespan = lifespan, 
	phys.lim.min = phys.lim.min, phys.lim.max = phys.lim.max, 
	male.fledge.n.mean = male.fledge.n.mean, male.fledge.n.sd = male.fledge.n.sd, 
	male.fledge.n = male.fledge.n, disp.age = disp.age, 
	disp.distance.mean = disp.distance.mean, disp.distance.sd = disp.distance.sd, 
	mate.comp = mate.comp, prin = prin, all)

## ----Specify and call h.test()-------------------------------------------
target.data <- subset(song.data, Population=="Bear Valley" & Year==2005)$Trill.FBW
h.test1 <- h.test(summary.results=SongEvo3$summary.results, ts=ts, 
	target.data=target.data)

## ----Examine output from h.test()----------------------------------------
h.test1

## ----Plot song simulation data-------------------------------------------
#Plot
plot(SongEvo3$summary.results[1, , "trait.pop.mean"], xlab="Year", ylab="Bandwidth (Hz)", 
	xaxt="n", type="n", xlim=c(-0.5, 35.5), 
	ylim=c(min(SongEvo3$summary.results[, , "trait.pop.mean"], na.rm=TRUE), 
	max(SongEvo3$summary.results[, , "trait.pop.mean"], na.rm=TRUE)))
	for(p in 1:iteration){
		lines(SongEvo3$summary.results[p, , "trait.pop.mean"], col="light gray")
		}
freq.mean <- apply(SongEvo3$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))

#Plot 95% quantiles (which are similar to credible intervals)
quant.means <- apply (SongEvo3$summary.results[, , "trait.pop.mean"], MARGIN=2, quantile, 
	probs=c(0.95, 0.05), R=600, na.rm=TRUE)
lines(quant.means[1,], col="blue", lty=2)
lines(quant.means[2,], col="blue", lty=2)

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
points(rep(ts, length(target.data)), target.data)

library("boot")
sample.mean <- function(d, x) {
	mean(d[x])
}
boot_curr <- boot(target.data, statistic=sample.mean, R=100)#, strata=mn.res$iteration)	
ci.curr <- boot.ci(boot_curr, conf=0.95, type="basic")
low <- ci.curr$basic[4]
high <- ci.curr$basic[5]
points(years, mean(target.data), pch=20, cex=0.6, col="black")
library("Hmisc")
errbar(x=years, y=mean(target.data), high, low, add=TRUE)

 #text and arrows
text(x=11, y=2850, labels="Historical songs", pos=1)
arrows(x0=5, y0=2750, x1=0.4, y1=mean(starting.trait), length=0.1)
text(x=25, y=2900, labels="Current songs", pos=1)
arrows(x0=25, y0=2920, x1=years, y1=mean(target.data), length=0.1)

