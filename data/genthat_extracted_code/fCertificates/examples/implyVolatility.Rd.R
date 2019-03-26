library(fCertificates)


### Name: implyVolatility
### Title: imply the volatility of the certificate with Newton/Raphson
### Aliases: implyVolatility
### Keywords: math

### ** Examples

p <- DiscountCertificate(S=100, X=110, Time=1, r=0.01, r_d=0, sigma=0.5)
implyVolatility(price=p, DiscountCertificate, S=100, X=110, Time=1, r=0.01, r_d=0)
  
p <- DiscountCertificate(S=100, X=110, Time=1, r=0.01, r_d=0, sigma=0.5)
implyVolatility(price=p, DiscountCertificate, doPlot=TRUE, S=100, X=110, Time=1, r=0.01, r_d=0)



