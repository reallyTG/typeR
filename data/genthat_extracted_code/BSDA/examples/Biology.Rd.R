library(BSDA)


### Name: Biology
### Title: Test scores on first exam in biology class
### Aliases: Biology
### Keywords: datasets

### ** Examples


hist(Biology$score, breaks = "scott", col = "brown", freq = FALSE, 
main = "Problem 1.49", xlab = "Test Score")
lines(density(Biology$score), lwd=3)




