library(vcdExtra)


### Name: AirCrash
### Title: Air Crash Data
### Aliases: AirCrash
### Keywords: datasets

### ** Examples

data(AirCrash)
aircrash.tab <- xtabs(~Phase + Cause, data=AirCrash)
mosaic(aircrash.tab, shade=TRUE)

# fix label overlap
mosaic(aircrash.tab, shade=TRUE, 
       labeling_args=list(rot_labels=c(30, 30, 30, 30)))

# reorder by Phase
phase.ord <- rev(c(3,4,1,2,5))
mosaic(aircrash.tab[phase.ord,], shade=TRUE, 
       labeling_args=list(rot_labels=c(30, 30, 30, 30)), offset_varnames=0.5)

# reorder by frequency
phase.ord <- order(rowSums(aircrash.tab), decreasing=TRUE)
cause.ord <- order(colSums(aircrash.tab), decreasing=TRUE)
mosaic(aircrash.tab[phase.ord,cause.ord], shade=TRUE, 
       labeling_args=list(rot_labels=c(30, 30, 30, 30)))


library(ca)
aircrash.ca <- ca(aircrash.tab)
plot(aircrash.ca)



