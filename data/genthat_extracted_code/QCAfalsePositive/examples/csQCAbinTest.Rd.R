library(QCAfalsePositive)


### Name: csQCAbinTest
### Title: A Simple Binomial Test for Type I Error in csQCA
### Aliases: csQCAbinTest
### Keywords: Binomial adjust csQCA inference multiple p-value

### ** Examples

test <- csQCAbinTest(freq.y=0.7, configs=list(aB=5, bCD=3, Ce=2),
   total.configs=20)
summary(test)



