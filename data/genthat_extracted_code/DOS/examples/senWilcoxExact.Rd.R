library(DOS)


### Name: senWilcoxExact
### Title: Exact Sensitivity Analysis for Wilcoxon's Signed-rank Statistic
### Aliases: senWilcoxExact

### ** Examples

data(werfel)
d<-werfel$serpc_p-werfel$cerpc_p

# Reproduces the exact one-sided P-value computed in Section 3.9 of Rosenbaum (2010).
senWilcoxExact(d,gamma=2)

# Agrees with the usual Wilcoxon procedures when gamma=1.
senWilcoxExact(d,gamma=1)
stats::wilcox.test(d,alternative="greater")

# Reproduces the one-sided confidence interval for gamma=3 in Table 3.3 of Rosenbaum (2010)
senWilcoxExact(d-0.0935,gamma=3)
senWilcoxExact(d-0.0936,gamma=3)



