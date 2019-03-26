library(MASS)


### Name: menarche
### Title: Age of Menarche in Warsaw
### Aliases: menarche
### Keywords: datasets

### ** Examples

mprob <- glm(cbind(Menarche, Total - Menarche) ~ Age,
             binomial(link = probit), data = menarche)



