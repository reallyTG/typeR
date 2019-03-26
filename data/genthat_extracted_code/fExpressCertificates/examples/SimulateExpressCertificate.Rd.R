library(fExpressCertificates)


### Name: SimulateExpressCertificate
### Title: Monte Carlo Valuation of Express Certificates
### Aliases: SimulateGenericExpressCertificate
###   SimulateExpressClassicCertificate SimulateExpressBonusCertificate
###   simExpressPriceMVN simExpressPriceTMVN

### ** Examples

## Not run: 
##D # Example CB7AXR on Deutsche Telekom on 10.12.2009
##D p <- SimulateExpressBonusCertificate(S=10.4/12.10*100, X=c(100,100,100), B=7/12.1*100, 
##D     K=c(134, 142.5, 151), 
##D 	T=.RLZ(c("16.12.2009","17.06.2010","17.12.2010"), start="10.12.2009"), r=0.01, r_d=0, 
##D 	sigma=0.23, mc.loops=10000, mc.steps=1000)
##D p
## End(Not run)



