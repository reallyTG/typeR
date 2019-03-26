library(huge)


### Name: huge.select
### Title: Model selection for high-dimensional undirected graph estimation
### Aliases: huge.select

### ** Examples

#generate data
L = huge.generator(d = 20, graph="hub")
out.mb = huge(L$data)
out.ct = huge(L$data, method = "ct")
out.glasso = huge(L$data, method = "glasso")

#model selection using ric
out.select = huge.select(out.mb)
plot(out.select)

#model selection using stars
#out.select = huge.select(out.ct, criterion = "stars", stars.thresh = 0.05,rep.num=10)
#plot(out.select)

#model selection using ebic
out.select = huge.select(out.glasso,criterion = "ebic")
plot(out.select)



