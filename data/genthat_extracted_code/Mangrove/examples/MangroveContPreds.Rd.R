library(Mangrove)


### Name: MangroveContPreds
### Title: The MangroveContPreds class
### Aliases: MangroveContPreds calcBetas applyBetas print.MangroveContPreds
###   summary.MangroveContPreds plot.MangroveContPreds
### Keywords: classes methods

### ** Examples

data(contped)
data(exampleBetas)
predbetas <- calcBetas(contped,exampleBetas)

summary(predbetas)
plot(predbetas)

contpreds <- applyBetas(predbetas,162,6.4)




