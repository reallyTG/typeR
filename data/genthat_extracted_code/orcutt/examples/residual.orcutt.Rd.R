library(orcutt)


### Name: residual.orcutt
### Title: Accessing Cochrane-Orcutt Fits
### Aliases: residual.orcutt
### Keywords: cochrane.orcutt

### ** Examples

## No test: 
data(icecream, package="orcutt")
lm = lm(cons ~ price + income + temp, data=icecream)
coch = cochrane.orcutt(lm)
residuals(coch)
## End(No test)



