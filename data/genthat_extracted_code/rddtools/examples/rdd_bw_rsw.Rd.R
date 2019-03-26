library(rddtools)


### Name: rdd_bw_rsw
### Title: Global bandwidth selector of Ruppert, Sheather and Wand (1995)
###   from package 'KernSmooth'
### Aliases: rdd_bw_rsw

### ** Examples

data(house)
rd<- rdd_data(x=house$x, y=house$y, cutpoint=0)
rdd_bw_rsw(rd)



