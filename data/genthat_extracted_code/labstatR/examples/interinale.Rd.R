library(labstatR)


### Name: interinale
### Title: Dati sul lavoro interinale
### Aliases: interinale
### Keywords: datasets

### ** Examples

data(interinale)
glm(avviato~., binomial, data=interinale) -> model
model
pr <- predict(model, type="response")
plot(density(pr),xlim=c(0,0.2),main="")



