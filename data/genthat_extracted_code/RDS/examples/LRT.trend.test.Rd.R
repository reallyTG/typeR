library(RDS)


### Name: LRT.trend.test
### Title: Compute a test of trend in prevalences based on a
###   likelihood-ratio statistic
### Aliases: LRT.trend.test LRT.trend
### Keywords: manip survey

### ** Examples


d <- t(data.frame(estimate=c(0.16,0.15,0.3), sigma=c(0.04,0.04,0.1)))
colnames(d) <- c("time_1","time_2","time_3") 
LRT.trend.test(d,number.of.bootstrap.samples=1000)



