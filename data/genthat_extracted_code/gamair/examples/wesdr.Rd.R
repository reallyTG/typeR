library(gamair)


### Name: wesdr
### Title: Diabetic retinopathy in Wisconsin
### Aliases: wesdr
### Keywords: data

### ** Examples

require(gamair);require(mgcv)
data(wesdr)
## Smooth ANOVA model...
k <- 5
b <- gam(ret~s(dur,k=k)+s(gly,k=k)+s(bmi,k=k)+ti(dur,gly,k=k)+
         ti(dur,bmi,k=k)+ti(gly,bmi,k=k),select=TRUE,
         data=wesdr,family=binomial(),method="ML")
ow <- options(warn=-1) ## avoid complaint about zlim 
plot(b,pages=1,scheme=1,zlim=c(-3,3))
options(ow)



