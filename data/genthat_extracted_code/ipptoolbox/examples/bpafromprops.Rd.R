library(ipptoolbox)


### Name: bpafromprobs
### Title: Obtain BPAs from statistical properties
### Aliases: dsminmeanmax dsminmodemax dsmeanvar

### ** Examples

pmin=10
pmean=30
pmode=60
pmax=100
pvar=5
y1=dsminmodemax(100,pmin,pmode,pmax)
dscdf(y1);

y2=dsminmeanmax(100,pmin,pmean,pmax)
dscdf(y2);

y3=dsmeanvar(100,pmean,pvar)
dscdf(y3)



