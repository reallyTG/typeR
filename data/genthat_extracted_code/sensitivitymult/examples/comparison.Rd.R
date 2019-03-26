library(sensitivitymult)


### Name: comparison
### Title: Sensitivity Analysis for a Comparison Involving Several Outcomes
###   in an Observational Study.
### Aliases: comparison
### Keywords: htest robust

### ** Examples

data(teeth)
attach(teeth)
# The following calculation reproduces the comparison in
# expression (5.1) of Rosenbaum (2016, p. 1464)
comparison(cbind(teeth$either4low,teeth$either4up),teeth$smoker,
   teeth$mset,c(.714,.286),gamma=2.2,trim=2.5,Scheffe=TRUE)
#
# The following example reproduces the deviate for lower teeth
# mentioned on line 4 of Rosenbaum (2016, p. 1466) as a one-sided
# test with w picked a priori as w=c(1,0):
comparison(cbind(either4low,either4up),smoker,mset,c(1,0),
   trim=2.5,gamma=2.2,apriori=TRUE)
# Because the previous comparison implicitly involves just one outcome, it
# could be done more simply with senm() as follows:
senm(either4low,smoker,mset,trim=2.5,gamma=2.2)
# Had one done all comparisons including the comparison for lower teeth,
# then one would need to adjust for multiple testing:
comparison(cbind(either4low,either4up),smoker,mset,c(1,0),
   trim=2.5,gamma=2.2,Scheffe=TRUE)
detach(teeth)



