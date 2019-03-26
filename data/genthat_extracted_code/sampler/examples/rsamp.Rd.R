library(sampler)


### Name: rsamp
### Title: Draws simple random sample without replacement
### Aliases: rsamp

### ** Examples

rsamp(albania, n=360, over=0.1, rep=FALSE)

size <- rsampcalc(nrow(albania), 3, 95, 0.5)
randomsample <- rsamp(albania, size)



