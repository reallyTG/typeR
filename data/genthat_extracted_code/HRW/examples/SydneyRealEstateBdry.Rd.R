library(HRW)


### Name: SydneyRealEstateBdry
### Title: Polygonal boundary of Sydney
### Aliases: SydneyRealEstateBdry

### ** Examples

library(HRW) ; data(SydneyRealEstateBdry) ; data(SydneyRealEstate)
plot(SydneyRealEstate$longitude,SydneyRealEstate$latitude,cex = 0.1)
lines(SydneyRealEstateBdry,lwd = 5,col = "red")



