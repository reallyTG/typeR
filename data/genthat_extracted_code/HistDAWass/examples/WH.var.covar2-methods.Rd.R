library(HistDAWass)


### Name: WH.var.covar2
### Title: Method WH.var.covar2
### Aliases: WH.var.covar2 WH.var.covar2,MatH,MatH-method
###   WH.var.covar2,MatH-method

### ** Examples

M1<-BLOOD[,1]
M2<-BLOOD[,2:3]
WH.var.covar2(M1,M2)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD))
WH.var.covar2(M1,M2,w=RN)



