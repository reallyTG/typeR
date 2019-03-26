library(StatDA)


### Name: RobCor.plot
### Title: Compares the Robust Estimation with the Classical
### Aliases: RobCor.plot
### Keywords: univar robust

### ** Examples

data(chorizon)
Be=chorizon[,"Be"]
Sr=chorizon[,"Sr"]
RobCor.plot(log10(Be),log10(Sr),xlab="Be in C-horizon [mg/kg]",
ylab="Sr in C-horizon [mg/kg]",cex.lab=1.2, pch=3, cex=0.7,
xaxt="n", yaxt="n",colC=1,colR=1,ltyC=2,ltyR=1)



