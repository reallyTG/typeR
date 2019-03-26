library(heplots)


### Name: Plastic
### Title: Plastic Film Data
### Aliases: Plastic
### Keywords: datasets

### ** Examples

str(Plastic)
plastic.mod <- lm(cbind(tear, gloss, opacity) ~ rate*additive, data=Plastic)
Anova(plastic.mod)

pairs(plastic.mod)



