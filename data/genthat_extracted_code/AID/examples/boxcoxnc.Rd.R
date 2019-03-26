library(AID)


### Name: boxcoxnc
### Title: Box-Cox Transformation for Normality of a Univariate Variable
### Aliases: boxcoxnc
### Keywords: functions

### ** Examples


library(AID)

data(textile)

out <- boxcoxnc(textile[,1], method = "sw")
out$lambda.hat # the estimate of Box-Cox parameter based on Shapiro-Wilk test statistic 
out$p.value # p.value of Shapiro-Wilk test for transformed data 
out$tf.data # transformed data set
confInt(out) # mean and confidence interval for back transformed data


out2 <- boxcoxnc(textile[,1], method = "sf")
out2$lambda.hat # the estimate of Box-Cox parameter based on Shapiro-Francia test statistic
out2$p.value # p.value of Shapiro-Francia test for transformed data 
out2$tf.data 
confInt(out2) 



