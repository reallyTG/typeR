library(MASS)


### Name: immer
### Title: Yields from a Barley Field Trial
### Aliases: immer
### Keywords: datasets

### ** Examples

immer.aov <- aov(cbind(Y1,Y2) ~ Loc + Var, data = immer)
summary(immer.aov)

immer.aov <- aov((Y1+Y2)/2 ~ Var + Loc, data = immer)
summary(immer.aov)
model.tables(immer.aov, type = "means", se = TRUE, cterms = "Var")



