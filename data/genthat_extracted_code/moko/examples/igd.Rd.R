library(moko)


### Name: igd
### Title: IGD: Inverted Generational Distance
### Aliases: igd

### ** Examples

aps <- ps(matrix(rnorm(1:1000),ncol=2))
tps <- ps(matrix(rnorm(1:2000),ncol=2))
igd(aps,tps)

tps <-nowacki_beam_tps$set[1:50 * 10,]
aps <- tps * 1.2
igd(aps,tps)



