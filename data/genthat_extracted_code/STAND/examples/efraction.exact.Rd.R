library(STAND)


### Name: efraction.exact
### Title: Exceedance Fraction and Exact Confidence Limits
### Aliases: efraction.exact
### Keywords: htest

### ** Examples

# calculate exceedance fraction and exact CLs for Example data
# Appendix  Mulhausen and Damiano(1998) Ignacion and Bullock (2006
data(aihand)
x <- aihand$x ;  det <- rep(1,length(x))
aiha<-data.frame(x,det) #  complete data
unlist(efraction.exact(x,gam=0.95,L=5) ) #  exact CLs
unlist(efraction.ml(aiha,gam=0.95,L=5))  #  ML CLs
unlist(efclnp(aiha,L=5))                 #  nonparametric CLs 



