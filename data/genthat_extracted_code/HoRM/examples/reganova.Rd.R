library(HoRM)


### Name: reg.anova
### Title: Expanded ANOVA Table
### Aliases: reg.anova
### Keywords: file

### ** Examples
 
## Applied to the toy dataset.

data(toy)

lm.out <- lm(y ~ x, data = toy)
anova(lm.out)
reg.anova(lm.out)



