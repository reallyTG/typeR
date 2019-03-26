library(untb)


### Name: untb
### Title: Ecological drift simulation under the Unified Neutral Theory of
###   Biodiversity
### Aliases: untb select select.immigrate select.mutate
### Keywords: math

### ** Examples


data(butterflies)
untb(start=butterflies, prob=0, gens=100)

a <- untb(start=1:10,prob=0.005, gens=1000,keep=TRUE)
plot(species.count(a),type="b")
matplot(species.table(a),type="l",lty=1)




