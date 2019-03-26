library(prop.comb.RR)


### Name: prop.RR
### Title: prop.RR
### Aliases: prop.RR

### ** Examples

# The Relative Risk was used by Maxwell (1961) for the following data related to 
# the rate of occurrence of virus infection among the group of the non-inoculated 
# and the group of the inoculated. The objetive is to obtain an approximate 
# confidence interval for RR.

prop.RR(x=c(11, 48), n=c(46, 102), conf.level=0.99)

# Price and Bonnet (2008) reviewed a study in which the aim is to prove if
# the effect of the beta-blocker could be highly beneficial or slightly detrimental.

x=c(7, 14); n=c(114, 116); prop.RR(x, n, rho=2)



