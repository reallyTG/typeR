library(CorrectedFDR)


### Name: EstimatorsFDR
### Title: Estimators of Local False Discovery Rate (LFDR)
### Aliases: EstimatorsFDR
### Keywords: CFDR False Discovery Rate LFDR NFDR Null RFDR hypothesis

### ** Examples

#The examples below are from the "ProData" package.
#In order to use the "Prodata" input you would first need to install the ProData package.
#You will also need the function exprs in this package.
#First, make sure that the ProData package is properly installed:
#source("https://bioconductor.org/biocLite.R")
#biocLite("ProData")
#library(ProData)
#data("f45cbmk")
#q1<- quantile(as(exprs(f45cbmk[, pData(f45cbmk)$GROUP == "B"]), "numeric"), probs = 0.25)
#logish<- function(x){log(x + q1)}
#Vectors of proteins for 20 patients ER/PR-positive and Healthy
#Y<- logish(exprs(f45cbmk[, pData(f45cbmk)$GROUP == "B"])) # Control (Healthy)
#X.ER<- logish(exprs(f45cbmk[, pData(f45cbmk)$GROUP == "C"])) # Case ER/PR-positive
#pvalue<- NULL
#for (i in 1:nrow(X.ER))
#{
# t<-t.test(x=X.ER[i,], y=Y[i,], alternative = "two.sided")
# pvalue[i]<- t$p.value
#}

#The pvalues obtained from the t-test:
pvalue<- c(0.1981, 0.3794, 0.000001443, 0.02325, 0.03264, 0.07263, 0.02965, 0.8016, 0.8888,
          0.9133, 0.2971, 0.4573, 0.2815, 0.0007119, 0.5743, 0.927, 0.369, 0.8478, 0.38, 0.9904)
output<- EstimatorsFDR(pvalue)
#Three lists
output$NFDR
output$CFDR
output$RFDR



