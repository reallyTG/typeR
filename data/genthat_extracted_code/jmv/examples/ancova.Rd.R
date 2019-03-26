library(jmv)


### Name: ancova
### Title: ANCOVA
### Aliases: ancova

### ** Examples

data('ToothGrowth')

ancova(formula = len ~ supp + dose, data = ToothGrowth)

#
#  ANCOVA
#
#  ANCOVA
#  -----------------------------------------------------------------------
#                 Sum of Squares    df    Mean Square    F        p
#  -----------------------------------------------------------------------
#    supp                    205     1          205.4     11.4     0.001
#    dose                   2224     1         2224.3    124.0    < .001
#    Residuals              1023    57           17.9
#  -----------------------------------------------------------------------
#

ancova(
    formula = len ~ supp + dose,
    data = ToothGrowth,
    postHoc = ~ supp,
    emMeans = ~ supp)




