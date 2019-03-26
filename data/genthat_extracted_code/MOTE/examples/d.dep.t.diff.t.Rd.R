library(MOTE)


### Name: d.dep.t.diff.t
### Title: d from t for Repeated Measures with SD Difference Scores
###   Denominator
### Aliases: d.dep.t.diff.t
### Keywords: dependent effect measures, paired repeated sample, size,
###   t-test t-test,

### ** Examples


#The following example is derived from the "dept_data" dataset included
#in the MOTE library.

#In a study to test the effects of science fiction movies on people’s belief
#in the supernatural, seven people completed a measure of belief in
#the supernatural before and after watching a popular science
#fiction movie. Higher scores indicated higher levels of belief.

    scifi = t.test(dept_data$before, dept_data$after, paired = TRUE)

#The t-test value was 1.43. You can type in the numbers directly,
#or refer to the dataset, as shown below.

    d.dep.t.diff.t(t = 1.43, n = 7, a = .05)

    d.dep.t.diff.t(1.43, 7, .05)

    d.dep.t.diff.t(scifi$statistic, length(dept_data$before), .05)

#The mean measure of belief on the pretest was 5.57, with a standard
#deviation of 1.99. The posttest scores appeared lower (M = 4.43, SD = 2.88)
#but the dependent t-test was not significant using alpha = .05,
#t(7) = 1.43, p = .203, d_z = 0.54. The effect size was a medium effect suggesting
#that the movie may have influenced belief in the supernatural.



