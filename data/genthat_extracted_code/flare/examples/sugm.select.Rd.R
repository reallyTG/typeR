library(flare)


### Name: sugm.select
### Title: Model selection for high-dimensional undirected graphical models
### Aliases: sugm.select

### ** Examples

## load package required
library(flare)

#generate data
L = sugm.generator(d = 10, graph="hub")
out1 = sugm(L$data)

#model selection using stars
#out1.select1 = sugm.select(out1, criterion = "stars", stars.thresh = 0.1)
#plot(out1.select1)

#model selection using cross validation
out1.select2 = sugm.select(out1, criterion = "cv")
plot(out1.select2)



