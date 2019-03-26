library(SixSigma)


### Name: ss.data.thickness
### Title: Metal Plates Thickness
### Aliases: ss.data.thickness
### Keywords: datasets

### ** Examples


data(ss.data.thickness)
str(ss.data.thickness) 
lattice::bwplot(thickness ~ shift | day,
    data = ss.data.thickness)




