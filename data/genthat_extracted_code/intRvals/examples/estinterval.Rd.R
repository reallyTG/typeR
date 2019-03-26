library(intRvals)


### Name: estinterval
### Title: Estimate interval model accounting for missed arrival
###   observations
### Aliases: estinterval

### ** Examples

data(goosedrop)
# calculate mean and standard deviation of arrival intervals, accounting for missed observations:
dr=estinterval(goosedrop$interval)
# plot some summary information
summary(dr)
# plot a histogram of the intervals and fit:
plot(dr)
# test whether the mean arrival interval is greater than 200 seconds:
ttest(dr,mu=200,alternative="greater")

# let's estimate mean and variance of dropping intervals by site
# (schiermonnikoog vs terschelling) for time period 5.
# first prepare the two datasets:
set1=goosedrop[goosedrop$site=="schiermonnikoog" & goosedrop$period == 5,]
set2=goosedrop[goosedrop$site=="terschelling"  & goosedrop$period == 5,]
# allowing a fraction of intervals to be distributed randomly (fpp='auto')
dr1=estinterval(set1$interval,fpp.method='auto')
dr2=estinterval(set2$interval,fpp.method='auto')
# plot the fits:
plot(dr1,xlim=c(0,1000))
plot(dr2,xlim=c(0,1000))
# mean dropping interval are not significantly different
# at the two sites (on a 0.95 confidence level):
ttest(dr1,dr2)
# now compare this test with a t-test not accounting for unobserved intervals:
t.test(set1$interval,set2$interval)
# not accounting for missed observations leads to a (spurious)
# larger difference in means, which also increases
# the apparent statistical significance of the difference between means



