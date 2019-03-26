library(jmv)


### Name: ANOVA
### Title: ANOVA
### Aliases: ANOVA anova

### ** Examples

data('ToothGrowth')

ANOVA(formula = len ~ dose * supp, data = ToothGrowth)

#
#  ANOVA
#
#  ANOVA
#  -----------------------------------------------------------------------
#                 Sum of Squares    df    Mean Square    F        p
#  -----------------------------------------------------------------------
#    dose                   2426     2         1213.2    92.00    < .001
#    supp                    205     1          205.4    15.57    < .001
#    dose:supp               108     2           54.2     4.11     0.022
#    Residuals               712    54           13.2
#  -----------------------------------------------------------------------
#

ANOVA(
    formula = len ~ dose * supp,
    data = ToothGrowth,
    emMeans = ~ supp + dose:supp, # est. marginal means for supp and dose:supp
    emmPlots = TRUE,              # produce plots of those marginal means
    emmTables = TRUE)             # produce tables of those marginal means




