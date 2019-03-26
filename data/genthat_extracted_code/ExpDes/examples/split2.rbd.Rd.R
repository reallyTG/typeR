library(ExpDes)


### Name: split2.rbd
### Title: Split-plots in RBD
### Aliases: split2.rbd

### ** Examples

data(ex)
attach(ex)
split2.rbd(trat, dose, rep, resp, quali = c(TRUE, FALSE), mcomp = "tukey", 
 fac.names = c("Treatament", "Dose"), sigT = 0.05, sigF = 0.05)



