library(simFrame)


### Name: draw
### Title: Draw a sample
### Aliases: draw draw-methods draw,data.frame,character-method
###   draw,data.frame,missing-method draw,data.frame,SampleSetup-method
###   draw,data.frame,VirtualSampleControl-method
### Keywords: distribution methods

### ** Examples

## load data
data(eusilcP)

## simple random sampling
draw(eusilcP[, c("id", "eqIncome")], size = 20)

## group sampling
draw(eusilcP[, c("hid", "id", "eqIncome")], 
    grouping = "hid", size = 10)

## stratified simple random sampling
draw(eusilcP[, c("id", "region", "eqIncome")], 
    design = "region", size = c(2, 5, 5, 3, 4, 5, 3, 5, 2))

## stratified group sampling
draw(eusilcP[, c("hid", "id", "region", "eqIncome")], 
    design = "region", grouping = "hid", 
    size = c(2, 5, 5, 3, 4, 5, 3, 5, 2))



