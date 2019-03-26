library(vcdExtra)


### Name: Mice
### Title: Mice Depletion Data
### Aliases: Mice
### Keywords: datasets

### ** Examples
 
data(Mice)
# make a table
ftable(mice.tab <- xtabs(Freq ~ litter + treatment + deaths, data=Mice))

library(vcd)
mosaic(mice.tab, shade=TRUE)




