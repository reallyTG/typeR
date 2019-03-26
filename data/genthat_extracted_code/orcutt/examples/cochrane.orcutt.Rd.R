library(orcutt)


### Name: cochrane.orcutt
### Title: Cochrane-Orcutt Estimation
### Aliases: cochrane.orcutt
### Keywords: lm

### ** Examples

## No test: 
data(icecream, package="orcutt")
lm = lm(cons ~ price + income + temp, data=icecream)
coch = cochrane.orcutt(lm)
coch
## End(No test)



