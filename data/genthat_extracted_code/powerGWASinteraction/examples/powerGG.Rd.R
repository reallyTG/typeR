library(powerGWASinteraction)


### Name: powerGG
### Title: Power for GxG interactions in genetic association studies
### Aliases: powerGG
### Keywords: methods

### ** Examples

mod1 <- list(prev=0.05, pGene1=0.3, pGene2=0.3, beta.LOR=c(0,0,.6),nSNP=500000)
powerGG(n=10000,mod=mod1,caco=0.5,alpha=.05,alpha1=.001)
powerGG(power=0.8,mod=mod1,caco=0.5,alpha=.05,alpha1=.001)



