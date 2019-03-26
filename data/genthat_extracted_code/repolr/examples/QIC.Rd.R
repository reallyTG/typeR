library(repolr)


### Name: QIC
### Title: Quasilikelihood Information Criterion
### Aliases: QIC
### Keywords: models

### ** Examples


data(HHSpain)
mod.0 <- repolr(HHSpain~Time, data=HHSpain, categories=4, subjects="Patient",
            times=c(1,2,5), corr.mod="independence", alpha=0.5)
QIC(mod.0)
QIC(update(mod.0, formula = HHSpain~Time + Sex))$QICu
QIC(update(mod.0, formula = HHSpain~Time * Sex))$QICu




