library(orcutt)


### Name: print.orcutt
### Title: Print Cochrane-Orcutt Estimation
### Aliases: print.orcutt
### Keywords: orcutt

### ** Examples

## No test: 
data(icecream, package="orcutt")
lm = lm(cons ~ price + income + temp, data=icecream)
coch = cochrane.orcutt(lm)
coch
## End(No test)



