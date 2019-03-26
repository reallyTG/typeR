library(marmap)


### Name: florida
### Title: Bathymetric data around Florida, USA
### Aliases: florida

### ** Examples

# load florida data
data(florida)

# class "bathy"
class(florida)
summary(florida)

# test plot.bathy
plot(florida,asp=1)
plot(florida,asp=1,image=TRUE,drawlabels=TRUE,land=TRUE,n=40)



