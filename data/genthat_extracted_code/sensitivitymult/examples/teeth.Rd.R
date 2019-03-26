library(sensitivitymult)


### Name: teeth
### Title: Smoking and Periodontal Disease.
### Aliases: teeth
### Keywords: datasets

### ** Examples

data(teeth)
attach(teeth)
# The following calculation reproduces the comparison
# in expression (5.1) of Rosenbaum (2016, p. 1464)
comparison(cbind(either4low,either4up),smoker,
   mset,c(.714,.286),gamma=2.2,trim=2.5,Scheffe=TRUE)
# Note that Rosenbaum (2016) used trim=2.5, but comparison()
# has a default of trim=3.
# The parameter gamma=2.2 is given alternative interpretations
# in Rosenbaum (2016, p. 1465) as follows:
amplify(2.2,c(3,4,5,6,7))
# The calculation (Rosenbaum 2016, p. 1465) for lower teeth alone is:
comparison(cbind(either4low,either4up),
  smoker,mset,c(1,0),gamma=2.2,trim=2.5,apriori=TRUE)
# Because w = c(1,0) ignores upper teeth, it may also be done as follows.
# Remove the comment sign to execute senmCI which is a little slow.
# senm(either4low,smoker,mset,gamma=2.2,trim=2.5)
# The calculations that follow reproduce the intervals from
# section 5.1 of Rosenbaum (2016, p. 1466)
# Remove the comment sign to execute senmCI which is a little slow.
# senmCI(teeth$either4low,teeth$smoker,teeth$mset,trim=2.5,gamma=1.5)
# The example that follows uses inner=0.5 as in Rosenbaum (2016,
# p. 1466, section 5.2):
comparison(cbind(either4low,either4up),smoker,
  mset,c(.714,.286),gamma=2.2,inner=.5,trim=2.5,Scheffe=TRUE)
comparison(cbind(either4low,either4up),smoker,
  mset,c(.714,.286),gamma=2.37,inner=.5,trim=2.5,Scheffe=TRUE)
detach(teeth)



