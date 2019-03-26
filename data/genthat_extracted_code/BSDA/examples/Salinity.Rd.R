library(BSDA)


### Name: Salinity
### Title: Surface-water salinity measurements from Whitewater Bay, Florida
### Aliases: Salinity
### Keywords: datasets

### ** Examples


stem(Salinity$salinity)
qqnorm(Salinity$salinity, pch = 19, col = "purple")
qqline(Salinity$salinity, col = "blue")
t.test(Salinity$salinity, conf.level = 0.99)
t.test(Salinity$salinity, conf.level = 0.99)$conf




