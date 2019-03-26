library(pubh)


### Name: xymultiple
### Title: Multiple comparisons with plot.
### Aliases: xymultiple

### ** Examples

library(multcomp)
data(birthwt)
birthwt$race <- factor(birthwt$race, labels = c("White", "Black", "Other"))
model1 <- aov(bwt ~ race, data = birthwt)
model1_glht <- glht(model1, linfct = mcp(race = "Tukey"))
xymultiple(model1_glht)

model2 <- glm(low ~ race, data = birthwt, family = binomial)
model2_glht <- glht(model2, linfct = mcp(race="Tukey"))
xymultiple(model2_glht, Exp = TRUE)



