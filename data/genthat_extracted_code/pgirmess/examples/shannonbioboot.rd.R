library(pgirmess)


### Name: shannonbioboot
### Title: Boostrap Shannon's and equitability indices
### Aliases: shannonbioboot
### Keywords: htest

### ** Examples

data(preybiom)
myboot<-shannonbioboot(preybiom[,5:6],B=100)
library(boot)
boot.ci(myboot, index=1,type=c("norm","basic","perc")) # confidence intervals for H'
boot.ci(myboot, index=2,type=c("norm","basic","perc")) # confidence intervals for J'



