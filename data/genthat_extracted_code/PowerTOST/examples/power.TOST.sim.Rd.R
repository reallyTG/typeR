library(PowerTOST)


### Name: power.TOST.sim
### Title: Power of the TOST procedure obtained via simulations
### Aliases: power.TOST.sim

### ** Examples

# using the default design 2x2, BE range 0.8 ... 1.25, logscale, theta0=0.95
power.TOST.sim(alpha=0.05, CV=0.3, n=12)
# should give 0.15054, with nsims=1E6 it will be 0.148533
# exact analytical is
power.TOST(alpha=0.05, CV=0.3, n=12)
# should give 0.1484695

# very unusual alpha setting
power.TOST.sim(alpha=0.9, CV=0.3, n=12)
# should give the same (within certain precision) as
power.TOST(alpha=0.95, CV=0.3, n=12)
# or also within certain precision equal to  
power.TOST(alpha=0.95, CV=0.3, n=12, method="mvt")
# SAS Proc Power gives here the incorrect value 0.60525



