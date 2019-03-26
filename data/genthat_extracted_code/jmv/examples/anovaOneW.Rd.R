library(jmv)


### Name: anovaOneW
### Title: One-Way ANOVA
### Aliases: anovaOneW

### ** Examples

data('ToothGrowth')
dat <- ToothGrowth
dat$dose <- factor(dat$dose)

anovaOneW(formula = len ~ dose, data = dat)

#
#  ONE-WAY ANOVA
#
#  One-Way ANOVA (Welch's)
#  ----------------------------------------
#           F       df1    df2     p
#  ----------------------------------------
#    len    68.4      2    37.7    < .001
#  ----------------------------------------
#




