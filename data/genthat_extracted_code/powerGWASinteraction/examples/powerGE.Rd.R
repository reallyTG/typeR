library(powerGWASinteraction)


### Name: powerGE
### Title: Power for GxE interactions in genetic association studies
### Aliases: powerGE

### ** Examples

mod1 <- list(prev=0.01,pGene=0.2,pEnv=0.2,beta.LOR=log(c(1.0,1.2,1.4)),orGE=1.2,nSNP=10^6)
results <- powerGE(n=20000, model=mod1,alpha1=.01)
print(results)

mod2 <- list(prev=0.01,pGene=0.2,pEnv=0.2,beta.LOR=log(c(1.0,1.0,1.4)),orGE=1,nSNP=10^6)
results <- powerGE(power=0.8, model=mod2,alpha1=.01)
print(results)



