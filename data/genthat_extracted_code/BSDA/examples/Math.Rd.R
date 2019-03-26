library(BSDA)


### Name: Math
### Title: Standardized math test scores for 30 students
### Aliases: Math
### Keywords: datasets

### ** Examples


stem(Math$score)
hist(Math$score, main = "Math Scores", xlab = "score", freq = FALSE)
lines(density(Math$score), col = "red")
CharlieZ <- (62 - mean(Math$score))/sd(Math$score)
CharlieZ
scale(Math$score)[which(Math$score == 62)]




