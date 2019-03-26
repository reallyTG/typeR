library(fExpressCertificates)


### Name: ExpressCertificate.Classic
### Title: Analytical and numerical pricing of Classic Express Certificates
### Aliases: ExpressCertificate.Classic
### Keywords: math

### ** Examples

ExpressCertificate.Classic(S=100, X=c(100), 
  T=c(1, 2), g = function(S) { S }, 
  K=142.5, r=0.01, r_d=0, sigma=0.3, ratio = 1)

ExpressCertificate.Classic(S=100, X=c(100), 
  T=c(1, 2), g = function(S) { max(S, 151) }, 
  K=142.5, r=0.01, r_d=0, sigma=0.3, ratio = 1)    



