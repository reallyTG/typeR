library(aods3)


### Name: varbin
### Title: Estimate of a Probability from Clustered Binomial Data
### Aliases: varbin print.varbin
### Keywords: datagen

### ** Examples

data(rabbits)
z <- rabbits[rabbits$group == "M", ]
varbin(z$n, z$m)
by(rabbits,
	list(group = rabbits$group),
  function(x) varbin(n = x$n, m = x$m, R = 1000))



