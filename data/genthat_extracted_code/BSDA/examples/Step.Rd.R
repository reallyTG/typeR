library(BSDA)


### Name: Step
### Title: STEP science test scores for a class of ability-grouped students
### Aliases: Step
### Keywords: datasets

### ** Examples


EDA(Step$score)
t.test(Step$score, mu = 80, alternative = "less")
wilcox.test(Step$score, mu = 80, alternative = "less")




