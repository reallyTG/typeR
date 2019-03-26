library(mlmRev)


### Name: Contraception
### Title: Contraceptive use in Bangladesh
### Aliases: Contraception
### Keywords: datasets

### ** Examples

str(Contraception)
summary(Contraception)
(fm1 <- glmer(use ~ urban+age+livch+(1|district), Contraception, binomial))
(fm2 <- glmer(use ~ urban+age+livch+(urban|district), Contraception, binomial))



