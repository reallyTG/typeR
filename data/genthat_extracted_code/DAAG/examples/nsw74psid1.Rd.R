library(DAAG)


### Name: nsw74psid1
### Title: Labour Training Evaluation Data
### Aliases: nsw74psid1
### Keywords: datasets

### ** Examples

print("Interpretation of Regression Coefficients - Example 6.6")

 nsw74psid1.lm <- lm(re78~ trt+ (age + educ + re74 + re75) +
   (black + hisp + marr + nodeg), data = nsw74psid1)
 summary(nsw74psid1.lm)$coef
options(digits=4)
sapply(nsw74psid1[, c(2,3,8,9,10)], quantile, prob=c(.25,.5,.75,.95,1))
attach(nsw74psid1)
sapply(nsw74psid1[trt==1, c(2,3,8,9,10)], quantile, 
prob=c(.25,.5,.75,.95,1))
pause()

here <- age <= 40 & re74<=5000 & re75 <= 5000 & re78 < 30000 
nsw74psidA <- nsw74psid1[here, ]
detach(nsw74psid1)
table(nsw74psidA$trt)
pause()

A1.lm <- lm(re78 ~ trt + (age + educ + re74 + re75) + (black +
      hisp + marr + nodeg), data = nsw74psidA)
summary(A1.lm)$coef
pause()

A2.lm <- lm(re78 ~ trt + (age + educ + re74 + re75) * (black +   
      hisp + marr + nodeg), data = nsw74psidA)
anova(A1.lm, A2.lm)




