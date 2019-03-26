library(neuropsychology)


### Name: APAze
### Title: APA6-ready output for (g)lm , (g)lmer objects and Bayes Factors
### Aliases: APAze

### ** Examples

require(neuropsychology)

df <- personality

fit <- lme4::lmer(Age ~ BMI + (1|Salary), data=df)
APAze(fit, method="Wald")



