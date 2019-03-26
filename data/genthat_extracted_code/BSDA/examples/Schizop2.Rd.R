library(BSDA)


### Name: Schizop2
### Title: Exam scores for 17 patients to assess the learning ability of
###   schizophrenics after taking a specified does of a tranquilizer
### Aliases: Schizop2
### Keywords: datasets

### ** Examples


hist(Schizop2$score, xlab = "score on standardized test after a tranquilizer", 
main = "Exercise 6.99", breaks = 10, col = "orange")
EDA(Schizop2$score)
SIGN.test(Schizop2$score, md = 22, alternative = "greater")




