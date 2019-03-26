library(npsurv)


### Name: icendata
### Title: Class of Interval-censored Data
### Aliases: icendata is.icendata icendata.object
### Keywords: function

### ** Examples

data(ap)
(x = icendata(ap))
is.icendata(x)

data(gastric)
icendata(gastric)

data(leukemia)
i = leukemia[,"group"] == "6-MP"
icendata(leukemia[i,1:2])



