library(rvgtest)


### Name: Perturbation
### Title: Generate Random Variates from a Perturbed RVG
### Aliases: pertadd pertsub
### Keywords: distribution datagen

### ** Examples

## Generating random sample with default settings
x <- pertadd(n=1000)
y <- pertsub(n=1000)

## Generating random sample, with parent distribution as exponential.
x <- pertadd(n=1000, rdist=rexp, rate=2, min=2, max=3, p=0.005)
y <- pertsub(n=1000, rdist=rexp, rate=2, min=2, max=3, p=0.005)

## Conducting chi-square test on random variates generated from function
## pertsub with parent distribution as exponential.
ft <- rvgt.ftable(n=1e4,rep=10,
                  rdist=function(n){pertsub(n,rdist=rexp,p=0.1)},
                  qdist=qexp,breaks=1001)
plot(ft)
rvgt.chisq(ft)

## Conducting chi-square test on random variates generated from function
## pertadd with parent distribution as Weibull,shape=1,scale=2.
ft <- rvgt.ftable(n=1e4,rep=10,
                  rdist=function(n,...){pertadd(n,rdist=rweibull,...,p=0.05)},
                  qdist=qweibull,shape=1,scale=2)
plot(ft)
rvgt.chisq(ft)



