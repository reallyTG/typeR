library(jmv)


### Name: contTablesPaired
### Title: Paired Samples Contingency Tables
### Aliases: contTablesPaired

### ** Examples

dat <- data.frame(
    `1st survey` = c('Approve', 'Approve', 'Disapprove', 'Disapprove'),
    `2nd survey` = c('Approve', 'Disapprove', 'Approve', 'Disapprove'),
    `Counts` = c(794, 150, 86, 570),
    check.names=FALSE)

contTablesPaired(formula = Counts ~ `1st survey`:`2nd survey`, data = dat)

#
#  PAIRED SAMPLES CONTINGENCY TABLES
#
#  Contingency Tables
#  ------------------------------------------------
#    1st survey    Approve    Disapprove    Total
#  ------------------------------------------------
#    Approve           794           150      944
#    Disapprove         86           570      656
#    Total             880           720     1600
#  ------------------------------------------------
#
#
#  McNemar Test
#  -----------------------------------------------------
#                                Value    df    p
#  -----------------------------------------------------
#    X²                           17.4     1    < .001
#    X² continuity correction     16.8     1    < .001
#  -----------------------------------------------------
#


# Alternatively, omit the left of the formula (`Counts`) from the
# formula if each row represents a single observation:

contTablesPaired(formula = ~ `1st survey`:`2nd survey`, data = dat)




