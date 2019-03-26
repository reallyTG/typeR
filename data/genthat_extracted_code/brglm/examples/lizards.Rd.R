library(brglm)


### Name: lizards
### Title: Habitat Preferences of Lizards
### Aliases: lizards
### Keywords: datasets

### ** Examples

data(lizards)
glm(cbind(grahami, opalinus) ~ height + diameter + light + time,
    family = binomial, data=lizards)
brglm(cbind(grahami, opalinus) ~ height + diameter + light + time,
    family = binomial, data=lizards)



