library(abd)


### Name: MouseEmpathy
### Title: Mouse Empathy
### Aliases: MouseEmpathy
### Keywords: datasets

### ** Examples

str(MouseEmpathy)

aov.fit <- aov(percent.stretching ~ treatment, data = MouseEmpathy)
summary(aov.fit)
lm.fit <- lm(percent.stretching ~ treatment, data = MouseEmpathy)
anova(lm.fit)



