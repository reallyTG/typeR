library(ordinalRR)


### Name: ordinalRR
### Title: Fit a Bayesian ordinal R&R model using JAGS.
### Aliases: ordinalRR
### Keywords: classes models methods

### ** Examples

## No test: 
          
data(followup)
followup
x=preprocess(followup)
g.random<-ordinalRR(x)
g.fixed<-ordinalRR(x,random=F)
## End(No test)
## Don't show: 
data(followup)
x=preprocess(followup[1:10,1:4],J=2,K=2,H=4)
g=ordinalRR(x,control=ordinalRR.control(rjags.B=10,rjags.Burn=10))
## End(Don't show)



