library(spaMM)


### Name: make_scaled_dist
### Title: Scaled distances between unique locations
### Aliases: make_scaled_dist rho.mapping Earth EarthChord
### Keywords: model

### ** Examples

data("blackcap")
## a biologically not very meaningful, but syntactically correct example of rho.mapping
corrHLfit(migStatus ~ 1 + Matern(1|latitude+longitude+means),data=blackcap,
          HLmethod="ML",ranFix=list(nu=0.5,phi=1e-6),
          init.corrHLfit=list(rho=c(1,1)),
          control.dist=list(rho.mapping=c(1,1,2)))
## Using orthodromic distances: order of variables in Matern(.|longitude+latitude) matters
corrHLfit(migStatus ~ 1 + Matern(1|longitude+latitude),data=blackcap,
          HLmethod="ML",ranFix=list(nu=0.5,phi=1e-6),
          control.dist=list(dist.method="Earth"))



