library(walrus)


### Name: ranova
### Title: Robust ANOVA
### Aliases: ranova

### ** Examples

data('goggles', package='WRS2')

ranova(goggles,
       dep = 'attractiveness',
       factors = c('gender', 'alcohol'),
       ph = TRUE)

#
#  ROBUST ANOVA
#
#  Robust ANOVA
#  ------------------------------------
#                      Q        p
#  ------------------------------------
#    gender             1.67    0.209
#    alcohol           48.28    0.001
#    gender:alcohol    26.26    0.001
#  ------------------------------------
#   Note. Method of trimmed means,
#   trim level 0.2
#
#
#  POST HOC TESTS
#
#  Post Hoc Tests - gender
#  --------------------------------------------------------
#                       psi-hat   p        Lower    Upper
#  --------------------------------------------------------
#    Female    Male     10.0      0.209    -6.00    26.0
#  --------------------------------------------------------
#
#
#  Post Hoc Tests - alcohol
#  -------------------------------------------------------------
#                           psi-hat   p         Lower    Upper
#  -------------------------------------------------------------
#    None       2 Pints     -3.33      0.611    -20.5     13.8
#    None       4 Pints     35.83     < .001     19.3     52.3
#    2 Pints    4 Pints     39.17     < .001     22.5     55.9
#  -------------------------------------------------------------
#




