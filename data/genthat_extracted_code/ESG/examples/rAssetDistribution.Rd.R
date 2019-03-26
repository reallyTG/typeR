library(ESG)


### Name: rAssetDistribution
### Title: rAssetDistribution
### Aliases: rAssetDistribution

### ** Examples

data(ZC)
rAssetDistribution(type="Zero-Coupon",t=2,T=3,vol=.1, k=2, ZC=ZC, nScenarios=100)
rAssetDistribution(type="Bond",t=3,T=35,nCoupons=20, couponsRate=0.3,vol=.1, k=2, ZC=ZC, nScenarios=10)
rAssetDistribution(type="CBond",t=5,T=35,nCoupons=5, couponsRate=0.3, omega=5,vol=.1, k=2, ZC=ZC, nScenarios=10,eta=.05, liquiditySpread0=.01, defaultSpread0=.01, volDefault=.2, alpha=.1, beta=1)
rAssetDistribution(type="EuroPut_Stock",5,25,Strike=98.5,vol=.1,k=2,ZC=ZC,volStock=.2, stock0=100, rho=.5,nScenarios=10)
rAssetDistribution(type="EuroCall_ZC",4,4.5,s=5, Strike=.985,vol=.1, k=2, ZC=ZC,nScenarios=10)
rAssetDistribution(type="EuroPut_ZC",4,4.5,s=5, Strike=.9385,vol=.1, k=2, ZC=ZC,nScenarios=10)



