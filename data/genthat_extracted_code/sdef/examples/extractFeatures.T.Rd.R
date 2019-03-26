library(sdef)


### Name: extractFeatures.T
### Title: Extracting the lists of features of interest
### Aliases: extractFeatures.T

### ** Examples

data = simulation(n=500,GammaA=1,GammaB=1,r1=0.5,r2=0.8,
DEfirst=300,DEsecond=200,DEcommon=100)
Th<- ratio(data=data$Pval)
feat.names = data$names
feat.lists.T <- extractFeatures.T(output.ratio=Th,
feat.names=feat.names)




