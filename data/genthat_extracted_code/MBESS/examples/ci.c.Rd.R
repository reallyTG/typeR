library(MBESS)


### Name: ci.c
### Title: Confidence interval for a contrast in a fixed effects ANOVA
### Aliases: ci.c
### Keywords: design

### ** Examples

# Here is a four group example. Suppose that the means of groups 1--4 are 2, 4, 9, 
# and 13, respectively. Further, let the error variance be .64 and thus the standard
# deviation would be .80 (note we use the standard deviation in the function, not the 
# variance). The contrast of interest here is the average of groups 1 and 4 versus the 
# average of groups 2 and 3. 

ci.c(means=c(2, 4, 9, 13), s.anova=.80, c.weights=c(.5, -.5, -.5, .5), 
n=c(3, 3, 3, 3), N=12, conf.level=.95)


# Here is an example with two groups. 
ci.c(means=c(1.6, 0), s.anova=.80, c.weights=c(1, -1), n=c(10, 10), N=20, conf.level=.95)


# An example given by Maxwell and Delaney (2004, pp. 155--171) :
# 24 subjects of mild hypertensives are assigned to one of four treatments: drug 
# therapy, biofeedback, dietary modification, and a treatment combining all the 
# three previous treatments. Subjects' blood pressure is measured two weeks
# after the termination of treatment. Now we want to form a 95% level
# confidence interval for the difference in blood pressure between subjects
# who received drug treatment and those who received biofeedback treatment 

## Drug group's mean = 94; group size=4
## Biofeedback group's mean = 91; group size=6 
## Diet group's mean = 92; group size=5
## Combination group's mean = 83; group size=5
## Mean Square Within (i.e., 'error.variance') = 67.375

ci.c(means=c(94, 91, 92, 83), s.anova=sqrt(67.375), c.weights=c(1, -1, 0, 0), 
n=c(4, 6, 5, 5), N=20, conf.level=.95)




