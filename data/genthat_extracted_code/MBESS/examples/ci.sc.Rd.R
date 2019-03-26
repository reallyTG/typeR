library(MBESS)


### Name: ci.sc
### Title: Confidence Interval for a Standardized Contrast in a Fixed
###   Effects ANOVA
### Aliases: ci.sc
### Keywords: design

### ** Examples

# Here is a four group example. Suppose that the means of groups 1--4 are 2, 4, 9, 
# and 13, respectively. Further, let the error variance be .64 and thus the standard
# deviation would be .80 (note we use the standard deviation in the function, not the 
# variance). The standardized contrast of interest here is the average of groups 1 and 4
# versus the average of groups 2 and 3. 

ci.sc(means=c(2, 4, 9, 13), s.anova=.80, c.weights=c(.5, -.5, -.5, .5), 
n=c(3, 3, 3, 3), N=12, conf.level=.95)


# Here is an example with two groups. 
ci.sc(means=c(1.6, 0), s.anova=.80, c.weights=c(1, -1), n=c(10, 10), N=20, conf.level=.95)



