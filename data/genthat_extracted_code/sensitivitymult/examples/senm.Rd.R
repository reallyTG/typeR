library(sensitivitymult)


### Name: senm
### Title: Sensitivity Analysis for a Matched Comparison in an
###   Observational Study.
### Aliases: senm
### Keywords: htest robust

### ** Examples

data(teeth)
attach(teeth)
# The following example reproduces the deviate for lower teeth
# mentioned on line 4 of Rosenbaum (2016, p. 1466).
senm(either4low,smoker,mset,trim=2.5,gamma=2.2)
# The calculation above is equivalent to using comparison()
# with weights w=c(0,1) so upper teeth are ignored.
comparison(cbind(either4up,either4low),smoker,mset,c(0,1),trim=2.5,gamma=2.2)
# The following example illustrates the permutational t-test
# which uses the mean of the pair differences as a test statistic.
senm(either4low,smoker,mset,trim=Inf,TonT=TRUE)
dif<-either4low[smoker==1]-either4low[smoker==0] # Matched pair differences
mean(dif) # Equals the test statistic above
detach(teeth)



