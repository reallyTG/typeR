library(QCAfalsePositive)


### Name: mvQCAbinTest
### Title: A Simple Binomial Test for Type I Error in mvQCA
### Aliases: mvQCAbinTest
### Keywords: Binomial adjust inference multiple mvQCA p-value

### ** Examples

test <- mvQCAbinTest(freq.y=0.7, configs=list(aB=5, bCD=3, Ce=2),
   total.configs=20)
summary(test)



