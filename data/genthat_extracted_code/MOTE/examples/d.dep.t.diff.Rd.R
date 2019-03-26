library(MOTE)


### Name: d.dep.t.diff
### Title: d for Dependent t with SD Difference Scores Denominator
### Aliases: d.dep.t.diff
### Keywords: dependent effect size, t-test

### ** Examples


#The following example is derived from the "dept_data" dataset included
#in the MOTE library.

#In a study to test the effects of science fiction movies on people's
#belief in the supernatural, seven people completed a measure of belief
#in the supernatural before and after watching a popular science fiction movie.
#Higher scores indicated higher levels of belief. The mean difference score was 1.14,
#while the standard deviation of the difference scores was 2.12.

#You can type in the numbers directly as shown below,
#or refer to your dataset within the function.

    d.dep.t.diff(mdiff = 1.14, sddiff = 2.12, n = 7, a = .05)

    d.dep.t.diff(1.14, 2.12, 7, .05)

    d.dep.t.diff(mdiff = mean(dept_data$before - dept_data$after),
                 sddiff = sd(dept_data$before - dept_data$after),
                 n = length(dept_data$before),
                 a = .05)

#The mean measure of belief on the pretest was 5.57, with a standard
#deviation of 1.99. The posttest scores appeared lower (M = 4.43, SD = 2.88)
#but the dependent t-test was not significant using alpha = .05,
#t(7) = 1.43, p = .203, d_z = 0.54. The effect size was a medium
#effect suggesting that the movie may have influenced belief
#in the supernatural.




