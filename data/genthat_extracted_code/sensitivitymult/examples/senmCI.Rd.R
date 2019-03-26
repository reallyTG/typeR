library(sensitivitymult)


### Name: senmCI
### Title: Sensitivity Analysis for a Confidence Interval.
### Aliases: senmCI
### Keywords: htest robust

### ** Examples

data(teeth)
attach(teeth)
#
# Note: Computing confidence intervals takes a few moments
# The calls to senmCI() are commented to meet time requirements
# for cran examples.  Remove the comment symbol to run them.
#
# The calculations that follow reproduce the intervals from
# section 5.1 of Rosenbaum (2016, p. 1466)
# senmCI(either4low,smoker,mset,trim=2.5,gamma=1.5)
# senmCI(either4up,smoker,mset,trim=2.5,gamma=1.5)
# Confidence interval using the mean by inverting the
# permuational t-test.
# senmCI(either4low,smoker,mset,trim=Inf,TonT=TRUE)
dif<-either4low[smoker==1]-either4low[smoker==0] # Matched pair differences
mean(dif) # Equals the point estimate above
t.test(dif) # But permutational t-interval and t-interval differ
# Sensitivity analysis using the mean difference
# senmCI(either4low,smoker,mset,gamma=1.5,trim=Inf,TonT=TRUE)
detach(teeth)



