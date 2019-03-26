library(pcIRT)


### Name: iccplot.CRSM
### Title: Item Characteristic Curve
### Aliases: iccplot.CRSM iccplot.DRM iccplot.MPRM iccplot iccplot.CRSM
###   iccplot.MPRM iccplot.DRM
### Keywords: characteristic curve, function item

### ** Examples


#estimate CRSM for the first three items
data(analog)
res_cr <- CRSM(extraversion, low=-10, high=10)

#ICC plot
iccplot(res_cr)





