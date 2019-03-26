library(rddtools)


### Name: rdd_bw_ik
### Title: Imbens-Kalyanaraman Optimal Bandwidth Calculation
### Aliases: rdd_bw_ik

### ** Examples

data(house)
rd<- rdd_data(x=house$x, y=house$y, cutpoint=0)
rdd_bw_ik(rd)



