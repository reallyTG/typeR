library(sdef)


### Name: Tmc
### Title: Empirical null distribution of max T(h)
### Aliases: Tmc

### ** Examples

data = simulation(n=500,GammaA=1,GammaB=1,
r1=0.5,r2=0.8,DEfirst=300,DEsecond=200,
DEcommon=100)
Th<- ratio(data=data$Pval)
MC<- Tmc(iter=50,output.ratio=Th)




