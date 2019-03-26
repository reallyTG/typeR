library(GD)


### Name: riskmean
### Title: Geographical detectors: risk means in risk detector.
### Aliases: riskmean print.riskmean plot.riskmean

### ** Examples

rm1 <- riskmean(NDVIchange ~ Climatezone + Mining, data = ndvi_40)
rm1
plot(rm1)
## No test: 
data <- ndvi_40[,1:3]
rm2 <- riskmean(NDVIchange ~ ., data = data)
rm2
## End(No test)




