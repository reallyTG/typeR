library(jmv)


### Name: ttestOneS
### Title: One Sample T-Test
### Aliases: ttestOneS

### ** Examples

data('ToothGrowth')

ttestOneS(ToothGrowth, vars = vars(len, dose))

#
#  ONE SAMPLE T-TEST
#
#  One Sample T-Test
#  ------------------------------------------------------
#                           statistic    df      p
#  ------------------------------------------------------
#    len     Student's t         19.1    59.0    < .001
#    dose    Student's t         14.4    59.0    < .001
#  ------------------------------------------------------
#




