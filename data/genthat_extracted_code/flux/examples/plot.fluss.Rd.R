library(flux)


### Name: plot.fluss
### Title: Functions for bulk plotting of concentration change with time as
###   kind of diagnostic plots for flux rate calculations
### Aliases: plot.fluss plot.flux plot.fluxes plot.fluxx plot.fluxxes
### Keywords: hplot

### ** Examples

## load example data
data(tt.pre)

## extract field concentration measurements
gcd <- tt.pre[tt.pre$sampletype_a=="P",]

## partition the data into data tables per chamber measurement
# then do the partitioning
gcd.parts <- chop(gcd, factors = c("date", "spot", "veg"), 
nmes = c("date", "veg", "spot"))

## calculate flux rates for methane
# first define CH4 range limit (alternatively use flux.calib)
CH4.lim <- 30
# do the flux rate estimation
vp.CH4 <- list(CH4 = "CH4ppb", time = "time_min", CH4.gcq = "CH4Code", 
volume = "cham_vol", t.air = "temp_dC", area = "cham_area", p.air = 101325)
flux.CH4 <- flux(gcd.parts, var.par = vp.CH4, co2ntrol = NULL, 
range.lim=CH4.lim)

## look at the results table
flux.CH4

## plot the concentration-change-with-time-plots as kind of diagnostic
plot(flux.CH4, dims = c(3,6))



