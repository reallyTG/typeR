library(marima)


### Name: rand.shock
### Title: rand.shock
### Aliases: rand.shock

### ** Examples

set.seed(4711)
p1 <- check.one(matrix(rnorm(16),nrow=4))
p2 <- check.one(array(rnorm(32),dim=c(4, 4, 2)))
randshock <- rand.shock(ar.poly=p1, ma.poly=p2, L=6)
short.form(randshock)




