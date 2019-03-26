library(jmv)


### Name: anovaNP
### Title: One-Way ANOVA (Non-parametric)
### Aliases: anovaNP

### ** Examples

data('ToothGrowth')

anovaNP(formula = len ~ dose, data=ToothGrowth)

#
#  ONE-WAY ANOVA (NON-PARAMETRIC)
#
#  Kruskal-Wallis
#  -------------------------------
#           X²      df    p
#  -------------------------------
#    len    40.7     2    < .001
#  -------------------------------
#




