library(DOS)


### Name: werfel
### Title: Welding Fumes and DNA Damage
### Aliases: werfel
### Keywords: datasets

### ** Examples

data(werfel)
d<-werfel$serpc_p-werfel$cerpc_p

# Reproduces the approximate one-sided P-value computed in Section 3.5 of Rosenbaum (2010).
senWilcox(d,gamma=3)

# Agrees with the usual large sample Wilcoxon procedures when gamma=1.
senWilcox(d,gamma=1,conf.int=TRUE,alternative="twosided")
stats::wilcox.test(d,conf.int=TRUE,exact=FALSE,correct=FALSE)



