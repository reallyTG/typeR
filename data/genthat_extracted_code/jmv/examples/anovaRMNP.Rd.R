library(jmv)


### Name: anovaRMNP
### Title: Repeated Measures ANOVA (Non-parametric)
### Aliases: anovaRMNP

### ** Examples

data('bugs', package = 'jmv')

anovaRMNP(bugs, measures = vars(LDLF, LDHF, HDLF, HDHF))

#
#  REPEATED MEASURES ANOVA (NON-PARAMETRIC)
#
#  Friedman
#  ------------------------
#    X²      df    p
#  ------------------------
#    55.8     3    < .001
#  ------------------------
#




