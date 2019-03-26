library(SenSrivastava)


### Name: E4.12
### Title: Time taken by Professional Dieticians and Interns for Four
###   Patient Contact Activities
### Aliases: E4.12
### Keywords: datasets

### ** Examples

m1 <- lm(Time ~ SC+DC+MR+TR-1, data=E4.12, subset=Dietician=="Prof")
summary(m1)



