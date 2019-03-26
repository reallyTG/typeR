library(sparr)


### Name: burk
### Title: Burkitt's lymphoma in Uganda
### Aliases: burk
### Keywords: data

### ** Examples

data(burk)
summary(burk$cases)

par(mfrow=c(1,3))
plot(burk$cases)
plot(burk$controls)
plot(density(marks(burk$cases)),xlim=range(marks(burk$cases)))



