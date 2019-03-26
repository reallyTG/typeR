library(fdasrvf)


### Name: outlier.detection
### Title: Outlier Detection
### Aliases: outlier.detection
### Keywords: detection outlier srvf

### ** Examples

data("toy_data")
data("toy_warp")
q_outlier = outlier.detection(toy_warp$q0,toy_data$time,toy_warp$mqn,k=.1)



