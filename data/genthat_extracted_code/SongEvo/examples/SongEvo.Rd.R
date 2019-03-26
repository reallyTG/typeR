library(SongEvo)


### Name: SongEvo
### Title: Model bird song evolution
### Aliases: SongEvo

### ** Examples

### See vignette for an example that uses all functions in SongEvo.

### Load the example data: song.data

# To explore the SongEvo package, we will use a database of songs from Nuttall’s
# white-crowned sparrow (*Zonotrichia leucophrys nuttalli*) recorded at three
# locations in 1969 and 2005.

data("song.data")

# Examine global parameters.Global parameters describe our understanding of the
# system and may be measured or hypothesized. They are called "global" because
# they are used by many many functions and subroutines within functions. For
# descriptions of all adjustable parameters, see `?WCSP` or Danner et al. (year)
str(glo.parms)

# Share global parameters with the global environment. We make these parameters
# available in the global environment so that we can access them with minimal
# code.
list2env(glo.parms, globalenv())

#### Examine song data 

# Data include the population name (Bear Valley, PRBO, or Schooner), year of
# song recording (1969 or 2005), and the frequency bandwidth of the trill.
str(song.data)

### Simulate bird song evolution with `SongEvo()`

#### Define initial individuals

# In this example, we use songs from individual birds recorded in one population
# (PRBO) in the year 1969, which we will call `starting.trait`.
starting.trait <- subset(song.data, Population=="PRBO" & Year==1969)$Trill.FBW

# We want a starting population of 40 individuals, so we generate additional
# trait values to complement those from the existing 30 individuals. Then we
# create a data frame that includes a row for each individual; we add
# identification numbers, ages, and geographical coordinates for each
# individual.
starting.trait2 <- c(starting.trait, rnorm(n.territories-length(starting.trait), 
                                           mean=mean(starting.trait), 
                                           sd=sd(starting.trait)))
init.inds    <- data.frame(id = seq(1:n.territories), age = 2, trait = starting.trait2)
init.inds$x1 <- round(runif(n.territories, min=-122.481858, max=-122.447270), digits=8)
init.inds$y1 <- round(runif(n.territories, min=37.787768, max=37.805645), digits=8)

#### Specify and call the SongEvo model

# SongEvo() includes several settings, which we specify before running the
# model. For this example, we run the model for 10 iterations, over 36 years
# (i.e. 1969--2005). When conducting research with `SongEvo()`, users will want
# to increase the number iterations (e.g. to 100 or 1000). Each timestep is one
# year in this model (i.e. individuals complete all components of the model in 1
# year). We specify territory turnover rate here as an example of how to adjust
# parameter values.  We could adjust any other parameter value here also. The
# learning method specifies that individuals integrate songs heard from adults
# within the specified integration distance (intigrate.dist, in kilometers). In
# this example, we do not includ a lifespan, so we assign it NA. In this
# example, we do not model competition for mates, so specify it as FALSE. Last,
# specify all as TRUE in order to save data for every single simulated
# individual because we will use those data later for mapping. If we do not need
# data for each individual, we set all to FALSE because the all.inds data.frame
# becomes very large!
iteration <- 5
years <- 36
timestep <- 1
terr.turnover <- 0.5
learning.method <- "integrate"
integrate.dist <- 0.1
lifespan <- NA
mate.comp <- FALSE
prin <- FALSE
all <- TRUE

# Now we call SongEvo with our specifications and save it in an object called
# SongEvo1.
SongEvo1 <- SongEvo(init.inds = init.inds, 
                    iteration = iteration, 
                    steps = years,  
                    timestep = timestep, 
                    n.territories = n.territories, 
                    terr.turnover = terr.turnover, 
                    learning.method = learning.method, 
                    integrate.dist = integrate.dist, 
                    learning.error.d = learning.error.d, 
                    learning.error.sd = learning.error.sd, 
                    mortality.a = mortality.a, 
                    mortality.j = mortality.j, 
                    lifespan = lifespan, 
                    phys.lim.min = phys.lim.min, 
                    phys.lim.max = phys.lim.max, 
                    male.fledge.n.mean = male.fledge.n.mean, 
                    male.fledge.n.sd = male.fledge.n.sd, 
                    male.fledge.n = male.fledge.n, 
                    disp.age = disp.age, 
                    disp.distance.mean = disp.distance.mean, 
                    disp.distance.sd = disp.distance.sd, 
                    mate.comp = mate.comp, 
                    prin = prin, 
                    all)

#### Examine results from SongEvo model

# The model required the following time to run on your computer:
SongEvo1$time

## No test: 
# Three main objects hold data regarding the SongEvo model.  Additional objects
# are used temporarily within modules of the model.

# First, currently alive individuals are stored in a data frame called “inds.”
# Values within “inds” are updated throughout each of the iterations of the
# model, and “inds” can be viewed after the model is completed.
head(SongEvo1$inds, 5)

# Second, an array (i.e. a multi-dimensional table) entitled “summary.results”
# includes population summary values for each time step (dimension 1) in each
# iteration (dimension 2) of the model.  Population summary values are contained
# in five additional dimensions: population size for each time step of each
# iteration (“sample.n”), the population mean and variance of the song feature
# studied (“trait.pop.mean” and “trait.pop.variance”), with associated lower
# (“lci”) and upper (“uci”) confidence intervals.
dimnames(SongEvo1$summary.results)

# Third, individual values may optionally be concatenated and saved to one data
# frame entitled “all.inds.”  all.inds can become quite large, and is therefore
# only recommended if additional data analyses are desired.
head(SongEvo1$all.inds, 5)

#### Simulated population size

# We see that the simulated population size remains relatively stable over the
# course of 36 years. This code uses the summary.results array.
plot(SongEvo1$summary.results[1, , "sample.n"], 
     xlab="Year", ylab="Abundance", 
     type="n", xaxt="n", 
     ylim=c(0, max(SongEvo1$summary.results[, , "sample.n"], na.rm=TRUE)))
axis(side=1, at=seq(0, 40, by=5), labels=seq(1970, 2010, by=5))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "sample.n"], col="light gray")
		}
n.mean <- apply(SongEvo1$summary.results[, , "sample.n"], 2, mean, na.rm=TRUE)
lines(n.mean, col="red")
#Plot 95% quantiles
quant.means <- apply(SongEvo1$summary.results[, , "sample.n"], 
                     MARGIN=2, 
                     quantile, probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="red", lty=2)
lines(quant.means[2,], col="red", lty=2)

# Load Hmisc package for plotting functions.
library("Hmisc")

#### Simulated trait values

# We see that the mean trait values per iteration varied widely, though mean
# trait values over all iterations remained relatively stable. This code uses
# the summary.results array.
plot(SongEvo1$summary.results[1, , "trait.pop.mean"], 
     xlab="Year", ylab="Bandwidth (Hz)", 
     xaxt="n", type="n", 
     xlim=c(-0.5, 36), ylim=range(SongEvo1$summary.results[, , "trait.pop.mean"], na.rm=TRUE))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "trait.pop.mean"], col="light gray")
		}
freq.mean <- apply(SongEvo1$summary.results[, , "trait.pop.mean"], 2, mean, na.rm=TRUE)
lines(freq.mean, col="blue")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))#, tcl=-0.25, mgp=c(2,0.5,0))
#Plot 95% quantiles
quant.means <- apply(SongEvo1$summary.results[, , "trait.pop.mean"], 
                     MARGIN=2, 
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
errbar(x=0, y=mean(starting.trait), high, low, add=TRUE)
 #text and arrows
text(x=5, y=2720, labels="Historical songs", pos=1)
arrows(x0=5, y0=2750, x1=0.4, y1=mean(starting.trait), length=0.1)

#### Trait variance

# We see that variance for each iteration per year increased in the first few
# years and then stabilized. This code uses the summary.results array.

#plot variance for each iteration per year
plot(SongEvo1$summary.results[1, , "trait.pop.variance"], 
     xlab="Year", ylab="Bandwidth Variance (Hz)", 
     type="n", xaxt="n", 
     ylim=range(SongEvo1$summary.results[, , "trait.pop.variance"], na.rm=TRUE))
axis(side=1, at=seq(0, 40, by=5), labels=seq(1970, 2010, by=5))
	for(p in 1:iteration){
		lines(SongEvo1$summary.results[p, , "trait.pop.variance"], col="light gray")
		}
n.mean <- apply(SongEvo1$summary.results[, , "trait.pop.variance"], 2, mean, na.rm=TRUE)
lines(n.mean, col="green")
#Plot 95% quantiles
quant.means <- apply(SongEvo1$summary.results[, , "trait.pop.variance"], 
                     MARGIN=2, 
                     quantile, probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="green", lty=2)
lines(quant.means[2,], col="green", lty=2)

#### Maps

# The simulation results include geographical coordinates and are in a standard
# spatial data format, thus allowing calculation of a wide variety of spatial
# statistics.

# Load packages for making maps.
library("reshape2")
library("lattice")
library("sp")

# Convert data frame from long to wide format. This is necessary for making a
# multi-panel plot.
all.inds1 <- subset(SongEvo1$all.inds, iteration==1)
w <- dcast(as.data.frame(all.inds1), id ~ timestep, value.var="trait", fill=0)
all.inds1w <- merge(all.inds1, w, by="id")
names(all.inds1w) <- c(names(all.inds1), paste("Ts", seq(1:years), sep=""))

# Create a function to generate a continuous color palette--we will use the
# palette in the next call to make color ramp to represent the trait value.
rbPal <- colorRampPalette(c('blue','red')) 

# Plot maps, including a separate panel for each timestep (each of 36 years).
# Our example shows that individuals move across the landscape and that regional
# dialects evolve and move. The x-axis is longitude, the y-axis is latitude, and
# the color ramp indicates trill bandwidth in Hz.
spplot(all.inds1w[,-c(1:ncol(all.inds1))], 
       as.table=TRUE, 
       cuts=c(0, seq(from=1500, to=4500, by=10)), 
       ylab="", 
    # cuts specifies that the first level (e.g. <1500) is transparent.
       col.regions=c("transparent", rbPal(1000)), 
       colorkey=list(
         right=list(
           fun=draw.colorkey,
           args=list( 
             key=list(
               at=seq(1500, 4500, 10),
               col=rbPal(1000),
               labels=list(at=c(1500, 2000, 2500, 3000, 3500, 4000, 4500),
                           labels=c("1500", "2000", "2500", "3000", "3500", "4000", "4500")
               )
             )
           )
         )
       )
)

# In addition, you can plot simpler multi-panel maps that do not take advantage
# of the spatial data class.

# Lattice plot (not as a spatial frame)
it1 <- subset(SongEvo1$all.inds, iteration==1)
# Create a function to generate a continuous color palette
rbPal <- colorRampPalette(c('blue','red')) 
it1$Col <- rbPal(10)[as.numeric(cut(it1$trait, breaks = 10))]
xyplot(it1$y1~it1$x1 | it1$timestep, 
       groups=it1$trait, asp="iso", col=it1$Col, 
       xlab="Longitude", ylab="Latitude")
## End(No test)



