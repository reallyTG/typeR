library(CarletonStats)


### Name: bootPaired
### Title: Bootstrap paired data
### Aliases: bootPaired bootPaired.default bootPaired.formula
### Keywords: bootstrap randomization resampling

### ** Examples


#Bootstrap the mean difference of fat content in vanilla and chocolate ice
#cream. Data are paired becaues ice cream from the same manufacturer will
#have similar content.
Icecream
bootPaired(ChocFat ~ VanillaFat, data = Icecream)
bootPaired(Icecream$VanillaFat, Icecream$ChocFat)




