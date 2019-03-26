library(muStat)


### Name: SMN.pvalue
### Title: Stratified McNemar (TDT, sign) test for association studies
### Aliases: SMN.pvalue TDT.pvalue DMM.pvalue MCN.pvalue
### Keywords: htest multivariate nonparametric

### ** Examples


SMN.pvalues <- function(n, wP = 0.25, wQ = 0.25) {
  print(SMN.pvalue(
    n[1,1],n[1,2], n[2,1], n[2,3], n[3,2],n[3,3], wP, wQ, exact = FALSE))
  print(SMN.pvalue(
    n[1,1],n[1,2], n[2,1], n[2,3], n[3,2],n[3,3], wP, wQ, exact = TRUE))
}
TDT.pvalues <- function(n){
  print(TDT.pvalue(
    n[1,1],n[1,2], n[2,1],n[2,2],n[2,3], n[3,2],n[3,3], exact = FALSE))
  print(TDT.pvalue(
    n[1,1],n[1,2], n[2,1],n[2,2],n[2,3], n[3,2],n[3,3], exact = TRUE))
}   

  wP <- 0.25;  wQ <- 0.25

  n <- matrix(c(
      1,3,0,   wP, 
      1,0,1,(1-wP-wQ), 
      0,3,1,      wQ), ncol=4, byrow=TRUE)

  SMN.pvalues(n)
  TDT.pvalues(n)

  n[3,2] <- 1
  n[3,3] <- 3;  SMN.pvalues(n);  TDT.pvalues(n)

  n[2,2] <- 1;  SMN.pvalues(n);  TDT.pvalues(n)

  n[2,2] <- 3;  TDT.pvalues(n)
  n[2,2] <- 2;  TDT.pvalues(n)
  n[2,3] <- 3;  TDT.pvalues(n)

  SMN.pvalues(n, .25, .25)
  SMN.pvalues(n, .00, .50)
  SMN.pvalues(n, .50, .00)



