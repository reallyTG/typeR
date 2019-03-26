library(MEMSS)


### Name: ergoStool
### Title: Ergometrics experiment with stool types
### Aliases: ergoStool
### Keywords: datasets

### ** Examples

options(show.signif.stars = FALSE)
str(ergoStool)
print(m1 <- lmer(effort ~ Type + (1|Subject), ergoStool), corr = FALSE)
anova(m1)



