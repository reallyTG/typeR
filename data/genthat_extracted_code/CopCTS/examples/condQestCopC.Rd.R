library(CopCTS)


### Name: condQestCopC
### Title: Conditional Quantile Estimation
### Aliases: condQestCopC

### ** Examples

set.seed(20)
Y = genLatentY(cop = "Clayton", theta = 1, N = 30)
d = -0.5
delta = (Y>d)
Yc = pmax(d,Y)
cq60.real = condQestCopC(0.6,Yc,d,delta,copula=claytonCopula(1),nIS = 50,
                        MARGIN=pnorm,MARGIN.inv=qnorm)
### Use selected copula
selCopC = selectCopC(cop.type = c("Clayton","Frank"),Yc,d,delta,nIS=50)
cq60.est = condQestCopC(0.6,Yc,d,delta,selCopC$Selected,nIS=50)



