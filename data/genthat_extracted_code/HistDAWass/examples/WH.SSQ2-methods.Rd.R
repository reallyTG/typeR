library(HistDAWass)


### Name: WH.SSQ2
### Title: Method WH.SSQ2
### Aliases: WH.SSQ2 WH.SSQ2,MatH,MatH-method WH.SSQ2,MatH-method

### ** Examples

M1<-BLOOD[,1]
M2<-BLOOD[,2:3]
WH.SSQ2(M1,M2)
# generate a set of random weights
RN<-runif(get.MatH.nrows(BLOOD))
WH.SSQ2(M1,M2,w=RN)



