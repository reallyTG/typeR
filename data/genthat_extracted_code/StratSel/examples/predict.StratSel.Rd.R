library(StratSel)


### Name: predict
### Title: Prediction Function for Objects of the 'StratSel' Class
### Aliases: predict.StratSel
### Keywords: Prediction

### ** Examples

data(data.fake)
out1 <- StratSel(Y ~ var.A + var.B | var.C + var.D | var.E + var.C, data=data.fake, corr=FALSE)
predict(out1)
predict(out1, prob=TRUE)
predict(out1, profile=c(1,0.2,0.2,1,0.2,0.2,1,0.2,0.2))



