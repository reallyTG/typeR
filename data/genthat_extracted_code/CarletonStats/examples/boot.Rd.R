library(CarletonStats)


### Name: boot
### Title: Bootstrap
### Aliases: boot boot.default boot.formula
### Keywords: bootstrap randomization resampling

### ** Examples


#ToothGrowth data (supplied by R)
#bootstrap mean of a single numeric variable
boot(ToothGrowth$len)

#bootstrap difference in mean of tooth length for two groups.
boot(ToothGrowth$len, ToothGrowth$supp)

#same as above using formula syntax
boot(len ~ supp, data = ToothGrowth)




