library(wBoot)


### Name: boot.two.bca
### Title: BCa Bootstrap Independent Two-Samples Test and CI
### Aliases: boot.two.bca

### ** Examples

# Driving distances, in yards, for independent samples of drives off a
# 2-3/4" wooden tee and off a 3" Stinger Competition golf tee.
data("tees")
str(tees)
attach(tees)
# Note that the data are unstacked.

# 99% confidence interval for the difference between the mean driving
# distances of the two types of tees. Name variable DISTANCE.
boot.two.bca(REGULAR, STINGER, mean, stacked = FALSE, variable = "DISTANCE",
conf.level = 0.99)

# 95% (default) upper confidence bound for the difference between the mean
# driving distances of the two types of tees, a left-tailed test with null
# hypothesis -10 (i.e., the difference between the mean driving distances
# is -10 yards), and 99999 bootstrap replications. 
boot.two.bca(REGULAR, STINGER, mean, stacked = FALSE, null.hyp = -10,
alternative = "less", R = 99999)

# 95% (default) confidence interval for the difference between the standard
# deviations of the driving distances, and a two-tailed test with null
# hypothesis 0 (i.e., the standard deviations are equal). Name variable DISTANCE.
boot.two.bca(REGULAR, STINGER, sd, stacked = FALSE, variable = "DISTANCE", null.hyp = 0) 

detach(tees)  # clean up



