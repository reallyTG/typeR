library(tsDyn)


### Name: VECM
### Title: Estimation of Vector error correction model (VECM)
### Aliases: VECM
### Keywords: ts

### ** Examples


data(zeroyld)
data<-zeroyld

#Fit a VECM with Engle-Granger 2OLS estimator:
vecm.eg<-VECM(zeroyld, lag=2)

#Fit a VECM with Johansen MLE estimator:
vecm.jo<-VECM(zeroyld, lag=2, estim="ML")

#compare results with package vars:
if(require(vars)) {
 data(finland)
 #check long coint values
   all.equal(VECM(finland, lag=2, estim="ML", r=2)$model.specific$beta, 
             cajorls(ca.jo(finland, K=3, spec="transitory"), r=2)  $beta, check.attributes=FALSE)
# check OLS parameters
  all.equal(t(coefficients(VECM(finland, lag=2, estim="ML", r=2))), 
    coefficients(cajorls(ca.jo(finland, K=3, spec="transitory"), r=2)$rlm), check.attributes=FALSE)

}


##export to Latex
toLatex(vecm.eg)
toLatex(summary(vecm.eg))
options("show.signif.stars"=FALSE)
toLatex(summary(vecm.eg), parenthese="Pvalue")
options("show.signif.stars"=TRUE)






