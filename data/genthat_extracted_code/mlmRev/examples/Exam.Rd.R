library(mlmRev)


### Name: Exam
### Title: Exam scores from inner London
### Aliases: Exam
### Keywords: datasets

### ** Examples

str(Exam)
summary(Exam)
(fm1 <- lmer(normexam ~ standLRT + sex + schgend + (1|school), Exam))
(fm2 <- lmer(normexam ~ standLRT*sex + schgend + (1|school), Exam))
(fm3 <- lmer(normexam ~ standLRT*sex + schgend + (1|school), Exam))



