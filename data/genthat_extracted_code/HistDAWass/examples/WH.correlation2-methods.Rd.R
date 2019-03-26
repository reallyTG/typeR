library(HistDAWass)


### Name: WH.correlation2
### Title: Method WH.correlation2
### Aliases: WH.correlation2 WH.correlation2,MatH,MatH-method
###   WH.correlation2,MatH-method

### ** Examples

M1<-BLOOD[,1]
M2<-BLOOD[,2:3]
WH.correlation2(M1,M2)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD))
WH.correlation2(M1,M2,w=RN)



