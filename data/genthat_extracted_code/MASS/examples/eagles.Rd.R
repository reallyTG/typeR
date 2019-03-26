library(MASS)


### Name: eagles
### Title: Foraging Ecology of Bald Eagles
### Aliases: eagles
### Keywords: datasets

### ** Examples

eagles.glm <- glm(cbind(y, n - y) ~ P*A + V, data = eagles,
                  family = binomial)
dropterm(eagles.glm)
prof <- profile(eagles.glm)
plot(prof)
pairs(prof)



