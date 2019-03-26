library(TropFishR)


### Name: select_Millar
### Title: Millar's selectivity model
### Aliases: select_Millar

### ** Examples

data(haddock)

output <- select_Millar(haddock, x0 = c(-10,0.3,0),
   rtype = "tt.logistic")

plot(output, plotlens=seq(25,35,0.1), deviance_plot = FALSE)
legend("topleft",c("Control","Experimental"), lty=1:2, col=1:2)


# Gillnet
data(gillnet)

# Using inital estimates from old method
select_Millar(gillnet, x0 = NULL, rtype = "norm.loc")$value
select_Millar(gillnet, x0 = NULL, rtype = "norm.sca")$value
select_Millar(gillnet, x0 = NULL, rtype = "lognorm")$value

# Two rtypes which require starting values
select_Millar(gillnet, x0 = c(55,4,65,4,3), rtype="binorm.sca")
select_Millar(gillnet, x0 = c(4,0.2,4.2,0.1,2), rtype="bilognorm")

# Calculation with finer length resolution
output <- select_Millar(gillnet, x0 = NULL, rtype = "lognorm")
plot(output, plotlens=seq(40,90,0.1))

# Use alternate plot settings
output <- select_Millar(gillnet, x0 = NULL, rtype = "lognorm")
ncolor <- length(output$meshSizes)
plot(output, plotlens=seq(40,90,0.1), deviance_plot = FALSE,
 lty=1, col=rainbow(ncolor))
legend("topleft", col=rainbow(ncolor), legend=output$meshSizes,
 lty=1, title="Mesh size [cm]")

 # deviance plot only
 plot(output, plotlens=seq(40,90,0.1), selectivity_plot = FALSE)


# Stacked trammel net
# The data come from two experiments using different mesh sizes
# This analysis assumes common retention curve in both experiments.
# Note that summary function does not produce residual plot
# since lengths are not unique
data(trammelnet)

output <- select_Millar(trammelnet, x0 = c(25,4),
   rtype="norm.loc", rel.power = rep(1,6))

plot(output,plotlens=seq(10,40,0.1))




