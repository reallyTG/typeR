library(SongEvo)


### Name: par.sens
### Title: Parameter sensitivity
### Aliases: par.sens

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
starting.trait <- subset(song.data, Population=="Bear Valley" & Year==1969)$Trill.FBW
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

## No test: 
  
#### Examine par.sens results
# Examine results objects, which include two arrays: 

# The first array, `sens.results`, contains the SongEvo model results for each
# parameter. It has the following dimensions:
dimnames(par.sens1$sens.results)

# The second array, `sens.results.diff` contains the quantile range of trait
# values across iterations within a parameter value. It has the following
# dimensions:
dimnames(par.sens1$sens.results.diff)

# To assess sensitivity of SongEvo to a range of parameter values, plot the
# range in trait quantiles per year by the parameter value. We see that
# territory turnover values of 0.4--0.6 provided means and quantile ranges of
# trill bandwidths that are similar to those obtained with the published
# estimate of 0.5, indicating that the Acquire a Territory submodel is robust to
# realistic variation in those parameter values.

# In the figure, solid gray and black lines show the quantile range of song
# frequency per year over all iterations as parameterized with the published
# territory turnover rate (0.5; thick black line) and a range of values from 0.4
# to 0.6 (in steps of 0.05, light to dark gray). Orange lines show the mean and
# 2.5th and 97.5th quantiles of all quantile ranges.

# plot of range in trait quantiles by year by parameter value
plot(1:years, par.sens1$sens.results.diff[1,], 
     ylim=range(par.sens1$sens.results.diff, na.rm=TRUE), 
     type="l", 
     ylab="Quantile range (Hz)", xlab="Year", 
     col="transparent", xaxt="n")
axis(side=1, at=seq(0, 35, by=5), labels=seq(1970, 2005, by=5))
  #Make a continuous color ramp from gray to black
grbkPal <- colorRampPalette(c('gray','black'))
  
  #Plot a line for each parameter value
for(i in 1:length(par.range)){
lines(1:years, par.sens1$sens.results.diff[i,], 
      col=grbkPal(length(par.range))[i])
}
  #Plot values from published parameter values
lines(1:years, par.sens1$sens.results.diff[2,], col="black", lwd=4)
  #Calculate and plot mean and quantiles
quant.mean <- apply(par.sens1$sens.results.diff, 2, mean, na.rm=TRUE)
lines(quant.mean, col="orange")
#Plot 95% quantiles (which are similar to credible intervals)
  #95% quantiles of population means (narrower)
quant.means <- apply(par.sens1$sens.results.diff, MARGIN=2, 
                     quantile, probs=c(0.975, 0.025), R=600, na.rm=TRUE)
lines(quant.means[1,], col="orange", lty=2)
lines(quant.means[2,], col="orange", lty=2)
## End(No test)



