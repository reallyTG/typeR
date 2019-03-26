library(Luminescence)


### Name: calc_AliquotSize
### Title: Estimate the amount of grains on an aliquot
### Aliases: calc_AliquotSize

### ** Examples


## Estimate the amount of grains on a small aliquot
calc_AliquotSize(grain.size = c(100,150), sample.diameter = 1, MC.iter = 100)

## Calculate the mean packing density of large aliquots
calc_AliquotSize(grain.size = c(100,200), sample.diameter = 8,
                 grains.counted = c(2525,2312,2880), MC.iter = 100)




