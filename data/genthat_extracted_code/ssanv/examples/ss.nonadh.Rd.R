library(ssanv)


### Name: ss.nonadh
### Title: Find sample sizes accounting for nonadherence
### Aliases: ss.nonadh
### Keywords: htest

### ** Examples


### Suppose treatment will not work on about 30 percent of subjects 
### then rho0=.3 and clinically significant difference in means is .5 
ss.nonadh(delta=.5,rho0=.3)

## Binary data, quick calculation
ss.nonadh(mu0=.1,mu1=.4,refinement="B")
# Calculate Fisher.exact before packaging, took about 8 seconds
#example.of.Fisher.exact<-ss.nonadh(mu0=.1,mu1=.4,refinement="Fisher.exact")
data(example.of.Fisher.exact)
example.of.Fisher.exact




