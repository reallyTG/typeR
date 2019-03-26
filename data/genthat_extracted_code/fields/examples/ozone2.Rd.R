library(fields)


### Name: ozone2
### Title: Daily 8-hour ozone averages for sites in the Midwest
### Aliases: ozone2
### Keywords: datasets

### ** Examples

data( ozone2)

# pairwise correlation among all stations
# ( See cover.design to continue this example)
cor.mat<- cor( ozone2$y, use="pairwise")

#raw data image for day number 16 
good<- !is.na( ozone2$y[16,])
out<- as.image( ozone2$y[16,good], x=ozone2$lon.lat[good,])
image.plot( out)



