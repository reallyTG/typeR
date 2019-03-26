library(BSDA)


### Name: Hardwood
### Title: Tensile strength of Kraft paper for different percentages of
###   hardwood in the batches of pulp
### Aliases: Hardwood
### Keywords: datasets

### ** Examples


plot(tensile ~ hardwood, data = Hardwood)
model <- lm(tensile ~ hardwood, data = Hardwood)
abline(model, col = "red")
plot(model, which = 1)





