library(gap)


### Name: hwe.cc
### Title: A likelihood ratio test of population Hardy-Weinberg equilibrium
###   for case-control studies
### Aliases: hwe.cc
### Keywords: htest

### ** Examples

## Not run: 
##D 
##D ### Saba Sile, email of Jan 26, 2007, data always in order of GG AG AA, p=Pr(G),
##D ### q=1-p=Pr(A)
##D case=c(155,27,4)
##D ctrl=c(408,55,15)
##D k0=.2
##D initial1=c(1.0,0.94,0.0904)
##D initial2=c(logit(1-0.0904),log(0.94))
##D hwe.cc("recessive",case,ctrl,k0, initial1, initial2)
##D 
##D ### John Phillips III, TGFb1 data codon 10: TT CT CC, CC is abnormal and increasing
##D ### TGFb1 activity
##D case=c(29,78,13)
##D ctrl=c(17,28,6)
##D k0 <- 1e-5
##D initial1 <- c(2.45,2.45,0.34)
##D initial2 <- c(logit(1-0.34),log(2.45))
##D hwe.cc("dominant",case,ctrl,k0,initial1,initial2)
## End(Not run)



