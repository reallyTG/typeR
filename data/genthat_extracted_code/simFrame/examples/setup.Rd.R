library(simFrame)


### Name: setup
### Title: Set up multiple samples
### Aliases: setup setup-methods setup,data.frame,character-method
###   setup,data.frame,missing-method setup,data.frame,SampleControl-method
###   setup,data.frame,TwoStageControl-method
### Keywords: distribution methods

### ** Examples

set.seed(12345)  # for reproducibility
data(eusilcP)    # load data

## simple random sampling
srss <- setup(eusilcP, size = 20, k = 4)
summary(srss)
draw(eusilcP[, c("id", "eqIncome")], srss, i = 1)

## group sampling
gss <- setup(eusilcP, grouping = "hid", size = 10, k = 4)
summary(gss)
draw(eusilcP[, c("hid", "id", "eqIncome")], gss, i = 2)

## stratified simple random sampling
ssrss <- setup(eusilcP, design = "region", 
    size = c(2, 5, 5, 3, 4, 5, 3, 5, 2), k = 4)
summary(ssrss)
draw(eusilcP[, c("id", "region", "eqIncome")], ssrss, i = 3)

## stratified group sampling
sgss <- setup(eusilcP, design = "region", 
    grouping = "hid", size = c(2, 5, 5, 3, 4, 5, 3, 5, 2), k = 4)
summary(sgss)
draw(eusilcP[, c("hid", "id", "region", "eqIncome")], sgss, i = 4)



