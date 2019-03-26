library(afex)


### Name: md_15.1
### Title: Data 15.1 / 11.5 from Maxwell & Delaney
### Aliases: md_15.1
### Keywords: dataset

### ** Examples

### replicate results from Table 15.2 to 15.6 (Maxwell & Delaney, 2004, pp. 774)
data(md_15.1)

### ANOVA results (Table 15.2)
aov_4(iq ~ timecat + (timecat|id),data=md_15.1, anova_table=list(correction = "none"))

### Table 15.3 (random intercept only)
# we need to set the base level on the last level:
contrasts(md_15.1$timecat) <- contr.treatment(4, base = 4)
# "Type 3 Tests of Fixed Effects"
(t15.3 <- mixed(iq ~ timecat + (1|id),data=md_15.1, check.contrasts=FALSE))
# "Solution for Fixed Effects" and "Covariance Parameter Estimates"
summary(t15.3$full.model)

### make Figure 15.2
plot(NULL, NULL, ylim = c(80, 140), xlim = c(30, 48), ylab = "iq", xlab = "time")
plyr::d_ply(md_15.1, plyr::.(id), function(x) lines(as.numeric(as.character(x$timecat)), x$iq))

### Table 15.4, page 789
# random intercept plus slope
(t15.4 <- mixed(iq ~ timecat + (1+time|id),data=md_15.1, check.contrasts=FALSE))
summary(t15.4$full.model)

### Table 15.5, page 795
# set up polynomial contrasts for timecat
contrasts(md_15.1$timecat) <- contr.poly
# fit all parameters separately
(t15.5 <- mixed(iq ~ timecat + (1+time|id), data=md_15.1, check.contrasts=FALSE,
                  per.parameter="timecat"))
# quadratic trend is considerably off, conclusions stay the same.


### Table 15.6, page 797
# growth curve model
(t15.6 <- mixed(iq ~ time + (1+time|id),data=md_15.1))
summary(t15.6$full.model)




