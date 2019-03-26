library(SWMPr)


### Name: plot_quants
### Title: Create a plot of data for a single year overlaid on historical
###   data.
### Aliases: plot_quants plot_quants.swmpr

### ** Examples

# qaqc
dat <- qaqc(apacpwq)

# generate a plot of salinity for 2013 overlaid on 2012-2013 data
plot_quants(dat, 'sal', yr = 2013, yrstart = 2012, yrend = 2013)

# change some of the defaults
plot_quants(dat, 'sal', yr = 2013, yrstart = 2012, yrend = 2013, 
 bgcolor1 = 'lightsteelblue2', bgcolor2 = 'lightsteelblue4', 
 yaxislab = 'Salinity (psu)')



