library(embryogrowth)


### Name: MovingIncubation
### Title: Simulate incubation of a nest with the beginning of incubation
###   varying
### Aliases: MovingIncubation

### ** Examples

## Not run: 
##D library(embryogrowth)
##D data(resultNest_4p_SSM4p)
##D ti <- seq(from=0, to=(60*24*100), by=60)
##D temperatures <- rnorm(length(ti), 29, 5)
##D temperatures <- temperatures+ti/(60*24*100)/2
##D layout(mat=1:3)
##D parpre <- par(mar=c(4, 4, 1, 1)+0.4)
##D plot(ti/(60*24), temperatures, type="l", xlab="Days", 
##D      ylab=expression("Nest temperature in "*degree*"C"), bty="n", las=1)
##D # The sexualisation thermal reaction norm is calculated for South Pacific RMU
##D out <- MovingIncubation(NestsResult=resultNest_4p_SSM4p, 
##D      temperatures.df=data.frame(Time=ti, Temperature=temperatures),
##D      metabolic.heating = 0, 
##D      SexualisationTRN = structure(c(71.922411148397, 613.773055147801, 
##D      318.059753164125, 120.327257089974), 
##D      .Names = c("DHA", "DHH", "T12H", "Rho25")))
##D with(out, plot(Time/(60*24), Incubation.length.mean/(60*24), 
##D      xlab="Days along the season", 
##D      ylab="Incubation duration", 
##D      type="l", bty="n", las=1, ylim=c(74, 76)))
##D with(out, plot(Time/(60*24), TSP.MassWeighted.STRNWeighted.temperature.mean, 
##D      xlab="Days along the season", 
##D      ylab=expression("CTE for sex ratio in "*degree*"C"), 
##D       type="l", bty="n", las=1, ylim=c(30, 31)))
##D par(mar=parpre)
##D layout(mat=c(1))
## End(Not run)



