library(LSMonteCarlo)


### Name: LSMonteCarlo-package
### Title: American options pricing with Least Squares Monte Carlo method
### Aliases: LSMonteCarlo-package LSMonteCarlo
### Keywords: Quantitative Finance Option pricing Monte Carlo Regression

### ** Examples

Put<-AmerPutLSM(Spot=14.2, Strike=16.5, n=200, m=50)
summary(Put)
price(Put)
plot(AmerPutLSMPriceSurf(vols = (seq(0.1, 1.5, 0.2)), n=200, m=10, 
strikes = (seq(0.5, 1.9, 0.2))), color = divPalette(150, "RdBu"))



