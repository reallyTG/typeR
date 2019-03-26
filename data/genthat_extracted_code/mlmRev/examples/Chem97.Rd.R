library(mlmRev)


### Name: Chem97
### Title: Scores on A-level Chemistry in 1997
### Aliases: Chem97
### Keywords: datasets

### ** Examples

str(Chem97)
summary(Chem97)
(fm1 <- lmer(score ~ (1|school) + (1|lea), Chem97))
(fm2 <- lmer(score ~ gcsecnt + (1|school) + (1|lea), Chem97))



