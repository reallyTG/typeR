library(dave)


### Name: pcobiplot
### Title: Computing and plotting a biplot ordination using principal
###   coordinates analysis
### Aliases: pcobiplot pcobiplot.default plot.pcobiplot pcocoor
### Keywords: multivariate hplot

### ** Examples

sel.sp<- c(3,11,23,31,39,46,72,77,96)                        # selection of species
o.pcobiplot<- pcobiplot(sveg,method="bray",y=0.25)           # used pco
plot(o.pcobiplot,sel.sp=sel.sp,axes=c(1,2),shortnames=TRUE)  # plot of releves, sepecies



