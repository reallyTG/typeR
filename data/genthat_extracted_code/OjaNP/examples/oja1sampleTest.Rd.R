library(OjaNP)


### Name: oja1sampleTest
### Title: One Sample Location Test Based on Oja Signs and Ranks
### Aliases: oja1sampleTest
### Keywords: htest multivariate nonparametric

### ** Examples

data(biochem)
oja1sampleTest(biochem[,1:2], mu = c(1.1, 0.4))
oja1sampleTest(biochem[,1:2], mu = c(1.1, 0.4), method = "p")

oja1sampleTest(biochem[,1:2], mu = c(1.1, 0.4), scores = "rank")
oja1sampleTest(biochem[,1:2], mu = c(1.1, 0.4), scores = "rank", method = "p")



