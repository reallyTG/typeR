library(acid)


### Name: polarisation.ER
### Title: Polarisation Measure from Esteban and and Ray (1994)
### Aliases: polarisation.ER

### ** Examples

means<-rnorm(10)+5
shares<-  rep(1,length(means))
shares<-shares/sum(shares)
rho<-data.frame(means=means,shares=shares)
alpha<-1
polarisation.ER(alpha,rho,comp=FALSE)



