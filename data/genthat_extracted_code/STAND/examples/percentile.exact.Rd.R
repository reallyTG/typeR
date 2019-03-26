library(STAND)


### Name: percentile.exact
### Title: Estimate of Xp and Exact Confidence Limits for Normal/Lognormal
### Aliases: percentile.exact
### Keywords: htest

### ** Examples

#                      EXAMPLE 1
# calculate 95th percentile and exact CLs for Example data
# Appendix  Mulhausen and Damiano (1998)
data(aihand)
x <- aihand$x ;  det <- rep(1,length(x))
aiha <- data.frame(x,det) #  complete data
unlist(percentile.exact(x,gam=0.95,p=0.95) )[1:5]  #  exact CLs
unlist(percentile.ml(aiha,gam=0.95,p=0.95))   #  ML CLs
#                      EXAMPLE 2
#  Ignacio and Bullock (2006) Mulhausen and Damiano (1998)
#  Calculate TABLE VII.3 (page 272) Factor for One-Sided Tolerance
#  Limits for Normal Distribution (Abridged Version)
#  Same as Table III Burrows(1963) Panel 3 Page 138
nn <- c(seq(3,25),seq(30,50,5))
pv <-c(0.75,0.9,0.95,0.99,0.999)
tab <- matrix(0,length(nn),length(pv))
  for( k in (1:length(nn) ) ){
  xx <- seq(1,nn[k])
  for(j in (1:length(pv))) {
  tab[k,j ]<- percentile.exact(xx,pv[j],gam=0.95,FALSE)$Ku
}}
dimnames(tab)<-(list(nn,pv)) ; rm(nn,pv,xx)
round(tab,3)
#
#                      EXAMPLE 3
#  Calculate TABLE I One Sided Tolerance Factor K'
#  Tuggle(1982) Page 339 (Abridged Version)
nn <- c(seq(3,20),50,50000000)
pv <-c(0.9,0.95,0.99)
tab <- matrix(0,length(nn),length(pv))
  for( k in (1:length(nn) ) ){
  xx <- seq(1,nn[k])
  for(j in (1:length(pv))) {
  tab[k,j ]<- percentile.exact(xx,pv[j],gam=0.95,FALSE)$Kl
}}
dimnames(tab)<-(list(nn,pv)) ; rm(nn,pv,xx)
round(tab,3)



