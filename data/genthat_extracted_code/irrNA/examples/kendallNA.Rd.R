library(irrNA)


### Name: kendallNA
### Title: Kendall's coefficient of concordance W - generalized for
###   randomly incomplete datasets
### Aliases: kendallNA

### ** Examples

# Example 1:
data(ConsistNA)
# ConsistNA exhibits missing values and a perfect concordance
# between raters:
ConsistNA
# Common W-algorithms fail, since each row as well as each 
# column of ConsistNA exhibits unfilled cells and these missing 
# data are omitted column-wise or row-wise:
library(irr)
# try here: kendall(ConsistNA)
# But the generalization of Kendall's W implemeted in irrNA 
# is able to assess the perfect concordance, assuming that 
# the data were at least ordinally scaled and not tied, e.g. 
# that each rater really ranked the objects that he rated 
# without giving equal ranks to two or more objects.
kendallNA(ConsistNA)
#
# Example 2:
data(IndepNA)
# IndepNA exhibits missing values and zero variance between 
# the raters (just as well as between the objects):
IndepNA
# Common W-algorithms fail:
# try here: kendall(IndepNA)
# kendallNA includes all (rater-pairwise) available data in 
# its calculation (e.g. only Objects 1--4 when Rater1 and 
# Rater2 are correlated):
kendallNA(IndepNA)
#
# Example 3:
data(IndepW)
# IndepW exhibits missing values and a mean Spearman's rho,
# that equals zero:
IndepW
# Again, common W-algorithms fail:
# try here: kendall(IndepW)
# kendallNA includes all (rater-pairwise) available 
# data:
kendallNA(IndepW)



