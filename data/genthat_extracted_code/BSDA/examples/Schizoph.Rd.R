library(BSDA)


### Name: Schizoph
### Title: Standardized exam scores for 13 patients to investigate the
###   learning ability of schizophrenics after a specified dose of a
###   tranquilizer
### Aliases: Schizoph
### Keywords: datasets

### ** Examples


hist(Schizoph$score, xlab = "score on standardized test", 
main = "Example 6.10", breaks = 10, col = "orange")
EDA(Schizoph$score)
t.test(Schizoph$score, mu = 20)




