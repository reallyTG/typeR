library(sdef)


### Name: extractFeatures.R
### Title: Extracting the lists of features of interest
### Aliases: extractFeatures.R

### ** Examples

data = simulation(n=500,GammaA=1,GammaB=1,r1=0.5,r2=0.8,
DEfirst=300,DEsecond=200,DEcommon=100)
Th<- ratio(data=data$Pval)
Rh<- baymod(iter=100,output.ratio=Th)
feat.names = data$names
feat.lists <- extractFeatures.R(output.ratio=Th,output.bay=Rh,
feat.names=feat.names,h=NULL)




