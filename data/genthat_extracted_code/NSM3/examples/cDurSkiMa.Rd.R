library(NSM3)


### Name: cDurSkiMa
### Title: Computes a critical value for the Durbin, Skillings-Mack D
###   distribution.
### Aliases: cDurSkiMa
### Keywords: Durbin Skillings-Mack

### ** Examples

##Hollander, Wolfe, Chicken Chapter 7, comment 49 
obs.mat<-matrix(c(1,1,0,1,0,1,0,1,1),ncol=3,byrow=TRUE)
cDurSkiMa(.75,obs.mat)



