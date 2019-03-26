library(HLMdiag)


### Name: adjust_lmList.formula
### Title: Fitting Common Models via 'lm'
### Aliases: adjust_lmList adjust_lmList,formula,data.frame-method
###   adjust_lmList.formula
### Keywords: models regression

### ** Examples

data(Exam, package = 'mlmRev')
sepLM <- adjust_lmList(normexam ~ standLRT + sex + schgend | school, data = Exam)
confint(sepLM)



