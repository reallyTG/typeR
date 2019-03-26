library(NetworkToolbox)


### Name: threshold
### Title: Threshold Filter
### Aliases: threshold

### ** Examples

threshnet<-threshold(neoOpen)

alphanet<-threshold(neoOpen, thresh = "alpha", a = .05)

bonnet<-threshold(neoOpen, thresh = "bonferroni", a = .05)

FDRnet<-threshold(neoOpen, thresh = "FDR", a = .10)

propnet<-threshold(neoOpen, thresh = "proportional", a = .15)



