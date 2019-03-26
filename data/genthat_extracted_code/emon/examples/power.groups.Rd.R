library(emon)


### Name: power.groups
### Title: Power for comparing mean of two groups
### Aliases: power.groups

### ** Examples

library(MASS)

# In practice, \code{nsims} would be set to at least 1000

power.groups(change=2.5, change.type="A", n1=20, n2=20, pars1=c(10,2),
       pars2=2, test='P', distribution="Normal", nsims=50)

power.groups(change=2.5, change.type="A", n1=seq(5,25,5), n2=seq(5,25,5), pars1=c(10,2),
       pars2=2, test='P', distribution="Normal", nsims=50)

power.groups(change=25, change.type="M", n1=20, n2=20, pars1=10,
       test='P', distribution="Poisson", nsims=50)

power.groups(change=4, change.type="A", n1=20, n2=20, pars1=c(1,2),
       pars2=2, test='P', distribution="Lognormal", nsims=50)


# Keeping size constant
power.groups(change=100, change.type="M", n1=20, n2=20, pars1=c(5,2),
       pars2=2, test='P', distribution="Negbin", nsims=50)

# Keeping variance constant
s2 = size2.samevar(mu1=5, mu2=10, s1=2)   # 13.333
power.groups(change=100, change.type="M", n1=20, n2=20, pars1=c(5,2),
       pars2=s2, test='P', distribution="Negbin", nsims=50)




