library(hdrcde)


### Name: cde.bandwidths
### Title: Bandwidth calculation for conditional density estimation
### Aliases: cde.bandwidths
### Keywords: distribution smooth

### ** Examples


    bands <- cde.bandwidths(faithful$waiting,faithful$eruptions,method=2)
    plot(cde(faithful$waiting,faithful$eruptions,a=bands$a,b=bands$b))




