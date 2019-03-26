library(SixSigma)


### Name: ss.data.thickness2
### Title: Metal Plates thickness (extended)
### Aliases: ss.data.thickness2
### Keywords: datasets

### ** Examples


data(ss.data.thickness2)
str(ss.data.thickness2) 
lattice::dotplot(thickness ~ shift | day,
    data = ss.data.thickness2,
    layout = c(7, 1))




