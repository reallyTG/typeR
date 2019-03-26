library(BDP2)


### Name: plotBDP2
### Title: Plots
### Aliases: plotBDP2

### ** Examples

# See vignette for more details and examples
pF=0.3
pE=0.12
shape1F=0.3
shape2F=0.7
shape1E=0.12
shape2E=0.88
cF=0.01
cE=0.9
nvec=c(18:40)
interim.at=c(10,20,30)

# Type I error and probability of true stopping for the uninteresting response rate. 
ptrue=0.12
plotBDP2(x="n", y="PFstopEcall",
         n =nvec, interim.at = interim.at,
         pF=pF,cF=cF,pE=pE,cE=cE,ptrue=ptrue,
         shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E)


# Power and probability of false stopping for the target response rate. 
ptrue=0.3
plotBDP2(x="n", y="PFstopEcall",
         n =nvec, interim.at = interim.at,
         pF=pF,cF=cF,pE=pE,cE=cE,ptrue=ptrue,
         shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E)




