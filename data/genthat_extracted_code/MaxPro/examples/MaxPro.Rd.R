library(MaxPro)


### Name: MaxPro
### Title: Locally Optimal Maximum Projection Designs for Continuous
###   Factors
### Aliases: MaxPro
### Keywords: Design of Experiments Computer Experiments

### ** Examples


InitialDesign<-MaxProLHD(n = 10, p = 4)$Design 
DOX<-MaxPro(InitialDesign)
DOX$Design




