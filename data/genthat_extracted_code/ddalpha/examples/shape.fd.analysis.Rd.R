library(ddalpha)


### Name: shape.fd.analysis
### Title: Diagnostic Plot for First and Second Order Integrated and
###   Infimal Depths
### Aliases: shape.fd.analysis
### Keywords: depth functional outlier plot shape

### ** Examples

datafA = dataf.population()$dataf[1]
dataf = dataf.population()$dataf[2:20]
shape.fd.analysis(datafA,dataf,order=1)
shape.fd.analysis(datafA,dataf,order=2,approx=0)




