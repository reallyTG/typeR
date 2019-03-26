library(apaTables)


### Name: get.ci.partial.eta.squared
### Title: Calculates confidence interval for partial eta-squared in a
###   fixed-effects ANOVA
### Aliases: get.ci.partial.eta.squared

### ** Examples

# Smithson (2001) p. 619
get.ci.partial.eta.squared(F.value=6.00, df1=1, df2=42, conf.level=.90)
get.ci.partial.eta.squared(F.value=2.65, df1=6, df2=42, conf.level=.90)
get.ci.partial.eta.squared(F.value=2.60, df1=6, df2=42, conf.level=.90)

# Fidler & Thompson (2001) Fixed Effects 2x4 p. 594 (Table 6) / p. 596 (Table 8)
get.ci.partial.eta.squared(F.value=1.50, df1=1, df2=16, conf.level=.90)
get.ci.partial.eta.squared(F.value=4.00, df1=3, df2=16, conf.level=.90)
get.ci.partial.eta.squared(F.value=1.50, df1=3, df2=16, conf.level=.90)



