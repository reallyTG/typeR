library(lme4)


### Name: InstEval
### Title: University Lecture/Instructor Evaluations by Students at ETH
### Aliases: InstEval
### Keywords: datasets

### ** Examples

str(InstEval)

head(InstEval, 16)
xtabs(~ service + dept, InstEval)



