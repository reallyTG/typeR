library(lme4)


### Name: dummy
### Title: Dummy variables (experimental)
### Aliases: dummy

### ** Examples

data(Orthodont,package="nlme")
lmer(distance ~ age + (age|Subject) +
     (0+dummy(Sex, "Female")|Subject), data = Orthodont)



