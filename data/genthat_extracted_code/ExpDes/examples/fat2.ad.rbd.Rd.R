library(ExpDes)


### Name: fat2.ad.rbd
### Title: Double factorial scheme plus one additional treatment in RBD
### Aliases: fat2.ad.rbd

### ** Examples

data(ex7)
attach(ex7)
data(est21Ad)
fat2.ad.rbd(periodo, nivel, bloco, est21, est21Ad, quali=c(TRUE, FALSE), mcomp = "tukey", 
 fac.names = c("Period", "Level"), sigT = 0.05, sigF = 0.05)



