library(EMbC)


### Name: cnfm
### Title: Confusion matrix
### Aliases: cnfm cnfm,binClst,numeric-method
###   cnfm,binClstPath,missing-method cnfm,binClstStck,missing-method
###   cnfm,binClst,binClst-method

### ** Examples

# -- apply EMbC to the example path --
mybcp <- stbc(expth,info=-1)
# -- compute the confusion matrix --
cnfm(mybcp,expth$lbl)
# -- as we have expth$lbl the following also works --
cnfm(mybcp,mybcp@pth$lbl)
# -- or simply --
cnfm(mybcp)
# -- numerical differences with respect to the smoothed clustering --
cnfm(mybcp,smth(mybcp))



