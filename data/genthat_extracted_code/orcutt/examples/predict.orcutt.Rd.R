library(orcutt)


### Name: predict.orcutt
### Title: Predict method for Cochrane-Orcutt Estimation
### Aliases: predict.orcutt
### Keywords: cochrane.orcutt

### ** Examples

## No test: 
data(icecream, package="orcutt")
lm = lm(cons ~ price + income + temp, data=icecream)
coch = cochrane.orcutt(lm)
predict.coch = predict(coch)
## End(No test)



