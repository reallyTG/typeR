library(RBesT)


### Name: dBetaBinomial
### Title: Beta-Binomial Probabilities
### Aliases: dBetaBinomial
### Keywords: internal

### ** Examples


## Not run: 
##D # Ex1: Predictive distribution for uniform p
##D Ex1 =  dBetaBinomial( r=0:9,n=9,a=1,b=1)
##D Ex1
##D 
##D # Ex2: Predictive distribution at interim: n1=20, n=50
##D # Interim data: 4/20
##D # Probability to have 6 or more responders in 50 patients?
##D # That is: predictive probability >=2 in remaining 30?
##D 
##D # 1) Assume a weakly-informative Beta(a,1) prior with median 0.1 at trial start:
##D a = log(0.5)/log(0.1); b=1
##D p = dBetaBinomial(r=0:1,n=30,a=a+4,b=b+16)
##D 1-sum(p)
##D 
##D # 2) Assume a uniform prior at trial start:
##D p = dBetaBinomial(r=0:1,n=30,a=1+4,b=1+16)
##D 1-sum(p)
## End(Not run)




