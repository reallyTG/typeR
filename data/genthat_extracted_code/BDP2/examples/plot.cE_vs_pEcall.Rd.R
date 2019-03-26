library(BDP2)


### Name: plot.cE_vs_pEcall
### Title: Plot objects returned by plotBDP2()
### Aliases: plot.cE_vs_pEcall plot.cE_vs_pEstop

### ** Examples

shape1F=0.3
shape2F=0.7
shape1E=0.12
shape2E=0.88
res=plotBDP2(x="cE",y="PEcall",n=30,interim.at=15,
             pF=0.3,cF=0.01,pE=0.12,cE=seq(.5,1,by=.01),p0=0.3,p1=0.12,
             shape1F=shape1F,shape2F=shape2F,shape1E=shape1E,shape2E=shape2E,
             col=c("green","red"),cex.sub=.8)
plot(res)



