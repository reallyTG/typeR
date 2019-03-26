library(MOTE)


### Name: d.dep.t.rm
### Title: d for Repeated Measures with Average SD Denominator
### Aliases: d.dep.t.rm
### Keywords: cohen's correlation d, dependent effect measures,
###   paired-sample, repeated size, t-test,

### ** Examples


#The following example is derived from the "dept_data" dataset included
#in the MOTE library.

#In a study to test the effects of science fiction movies on people's
#belief in the supernatural, seven people completed a measure of belief
#in the supernatural before and after watching a popular science fiction
#movie. Higher scores indicated higher levels of belief.

    t.test(dept_data$before, dept_data$after, paired = TRUE)

    scifi_cor = cor(dept_data$before, dept_data$after, method = "pearson",
                use = "pairwise.complete.obs")

#You can type in the numbers directly, or refer to the dataset,
#as shown below.

    d.dep.t.rm(m1 = 5.57, m2 = 4.43, sd1 = 1.99,
                sd2 = 2.88, r = .68, n = 7, a = .05)

    d.dep.t.rm(5.57, 4.43, 1.99, 2.88, .68, 7, .05)

    d.dep.t.rm(mean(dept_data$before), mean(dept_data$after),
                sd(dept_data$before), sd(dept_data$after),
                scifi_cor, length(dept_data$before), .05)

#The mean measure of belief on the pretest was 5.57, with a standard
#deviation of 1.99. The posttest scores appeared lower (M = 4.43, SD = 2.88)
#but the dependent t-test was not significant using alpha = .05,
#t(7) = 1.43, p = .203, d_rm = 0.43. The effect size was a medium effect suggesting
#that the movie may have influenced belief in the supernatural.




