library(sjstats)


### Name: smpsize_lmm
### Title: Sample size for linear mixed models
### Aliases: smpsize_lmm

### ** Examples

# Sample size for multilevel model with 30 cluster groups and a small to
# medium effect size (Cohen's d) of 0.3. 27 subjects per cluster and
# hence a total sample size of about 802 observations is needed.
smpsize_lmm(eff.size = .3, k = 30)

# Sample size for multilevel model with 20 cluster groups and a medium
# to large effect size for linear models of 0.2. Five subjects per cluster and
# hence a total sample size of about 107 observations is needed.
smpsize_lmm(eff.size = .2, df.n = 5, k = 20, power = .9)





