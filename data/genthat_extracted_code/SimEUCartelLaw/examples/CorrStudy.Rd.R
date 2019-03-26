library(SimEUCartelLaw)


### Name: CorrStudy
### Title: Investigate the effect of correlated input parameters
### Aliases: CorrStudy

### ** Examples

Par <- list(Phi=c(0.1,0.5), Rho=c(0.5,0.9), Ksi=c(0.05,0.3), Chi=c(0.1,0.4),
            M=c(0.2,1.2), G=c(0.05,0.2), A=c(0.1,0.3))
res <- CorrStudy(params=Par, m=10000)
print(res)



