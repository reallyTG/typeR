library(loa)


### Name: 1.1.loaPlot
### Title: loaPlot, XYZ plots for lattice
### Aliases: 1.1.loaPlot loaPlot panel.loaPlot panel.loaPlot2 panel.loaGrid
### Keywords: methods

### ** Examples


## Example 1
## Basic usage

loaPlot(Ozone~Solar.R*Temp|Wind>8, 
        data=airquality, 
        col.regions="Blues")

# Notes:
# Formula structure z ~ x * y |cond like levelplot.
# Data (and groups) assignment like in standard lattice plots.
# By default z is linked to col and cex. 
# Unless overridden by user inputs or group or zcase setting. 
# Plot passed via ...Handler functions to provide shortcut plot 
# reworking, e.g. here colHandler handles color scales 
# using col.region to generate a color range. 
# (Here, arguments like "Blues" and c("green", "red") are 
# allowed and handled using functions in the RColorBrewer 
# package.)

# Formula stuctures:
# ~ x * y                like xyplot y ~ x
# ~ x * y | cond         like xyplot y ~ x | cond
# z ~ x * y              like xyplot y ~ x, col=f(z), cex=f(z)
# z ~ x * y | cond       like xyplot y ~ x | cond, col=f(z), cex=f(z)
# z ~ x * y, groups = g  like xyplot y ~ x, groups=g, cex=f(z)
# z1 + z2 ~ x * y        (zcases)
# etc


## Example 2 
## Basic modifications

loaPlot(Ozone~Solar.R*Temp, groups=airquality$Wind>8, 
        data=airquality) 

# When groups are applied, by default group id is linked to col.
# The follow example illustrates three options:

loaPlot(Ozone~Solar.R*Temp, groups=airquality$Wind>8, 
        data=airquality,  
        group.args=c("pch"), pch=c(1,4), 
        col="blue")

# notes:
# Here, group.args is used to change the default group arguments.
# (So, pch rather than col is used to identify groups.)
# pch is then assigned by group rather than by (x,y) case or z case. 
# (See panelPal Help further further details of assignments in loa.)
# col supplied by the user supercedes the default z linkage.
# (So, here cex remains z scales but col is fixed as blue.)


## Example 3 
## Key handling

loaPlot(Ozone~Solar.R*Temp, data=airquality, 
        col.regions=c("green", "red"))

# Key settings are by the key argument (as in lattice) 
# or key... arguments via keyHandler and listLoad, so e.g.:

loaPlot(Ozone~Solar.R*Temp, data=airquality, 
        col.regions=c("green", "red"), 
        key.fun = draw.loaColorKey)

# Notes:
# By default the loaPlot uses draw.loaPlotZKey to generate 
# its color key unless an alternative is supplied via key.fun.
# (Here, the draw.colorKey wrapper draw.loaColorKey is used to 
# generate a color bar similar to that in levelplot.)



## Example 4
## panels

loaPlot(Ozone~Solar.R*Temp|Wind>8, data=airquality, 
        col.regions="Reds")

# The combined use of loaPlot, panelPal and appropriately configured 
# panel functions provides automatical handling of a range of plot 
# elements, e.g.:

loaPlot(Ozone~Solar.R*Temp|Wind>8, data=airquality, 
        col.regions="Reds", panel=panel.binPlot)

# Notes:
# Here, the choice of default key is set by the panel... function;
# the panel by default bins data by location and for each bin cell
# calculates the mean Ozone concentration just like a standard 
# lattice panel would, but it also tracks these values (calculated 
# within the panels) and scales panel-to-panel and panel-to-key 
# so users do not have to do that retrospectively; and, finally, 
# it retains in-panel calculations so users can recover them.
# (See associated helps for further details: ?panelPal about methods; 
# and ?panel.binPlot about the panel function.)
 



