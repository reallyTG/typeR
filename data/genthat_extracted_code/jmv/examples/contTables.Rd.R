library(jmv)


### Name: contTables
### Title: Contingency Tables
### Aliases: contTables

### ** Examples

data('HairEyeColor')
dat <- as.data.frame(HairEyeColor)

contTables(formula = Freq ~ Hair:Eye, dat)

#
#  CONTINGENCY TABLES
#
#  Contingency Tables
#  -----------------------------------------------------
#    Hair     Brown    Blue    Hazel    Green    Total
#  -----------------------------------------------------
#    Black       68      20       15        5      108
#    Brown      119      84       54       29      286
#    Red         26      17       14       14       71
#    Blond        7      94       10       16      127
#    Total      220     215       93       64      592
#  -----------------------------------------------------
#
#
#  X² Tests
#  -------------------------------
#          Value    df    p
#  -------------------------------
#    X²      138     9    < .001
#    N       592
#  -------------------------------
#

# Alternatively, omit the left of the formula (`Freq`) if each row
# represents a single observation:

contTables(formula = ~ Hair:Eye, dat)




