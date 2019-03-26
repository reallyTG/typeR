library(sdef)


### Name: ratio
### Title: Ratio Th between the observed features in common and the
###   expected ones
### Aliases: ratio

### ** Examples

data = simulation(n=500,GammaA=1,GammaB=1,r1=0.5,r2=0.8,
DEfirst=300,DEsecond=200,DEcommon=100)
Th<- ratio(data=data$Pval)




