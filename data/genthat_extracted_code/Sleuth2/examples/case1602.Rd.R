library(Sleuth2)


### Name: case1602
### Title: Oat Bran and Cholesterol
### Aliases: case1602
### Keywords: datasets

### ** Examples

str(case1602)

subjects <- 1:20
ordersubjects <- order(case1602$Baseline)
plot(1:20, case1602$Baseline[ordersubjects], pch=24,
     xlab="Subjects (Ordered According to Baseline Cholesterol)",
     ylab="Total Serum Cholesterol (mg/dl)")
points(1:20, case1602$Lofiber[ordersubjects], pch=19, col=5)
points(1:20, case1602$Hifiber[ordersubjects], pch=21, col=3)
legend(1,245,legend=c("Baseline","After Low Fiber Diet","After High Fiber Diet"),
  pch=c(24,19,21),col=c(1,5,3))

diff <- with(case1602, Hifiber-Lofiber)
plot(subjects, diff, pch=ifelse(case1602$Order=="HL",19,21))
abline(h=0)
t.test(diff ~ Order, case1602) # Test for order of treatment effect
t.test(diff) # Test for treatment effect



