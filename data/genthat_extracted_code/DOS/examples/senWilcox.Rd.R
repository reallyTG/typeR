library(DOS)


### Name: senWilcox
### Title: Sensitivity Analysis for Wilcoxon's Signed-rank Statistic
### Aliases: senWilcox

### ** Examples

data(werfel)
d<-werfel$serpc_p-werfel$cerpc_p

# Reproduces the approximate one-sided P-value computed in Section 3.5 of Rosenbaum (2010).
senWilcox(d,gamma=3)

# Reproduces parts of Tables 4.3 and 4.4 in Rosenbaum (2002)
data(lead)
senWilcox(lead$dif,gamma=1,conf.int=TRUE,alternative="twosided")
senWilcox(lead$dif,gamma=2,conf.int=TRUE,alternative="twosided")

# Agrees with the usual Wilcoxon procedures when gamma=1.
senWilcox(d,gamma=1,conf.int=TRUE,alternative="twosided")
stats::wilcox.test(d,conf.int=TRUE,exact=FALSE,correct=FALSE)



