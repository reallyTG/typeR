library(fastclime)


### Name: fastclime.selector
### Title: A precision matrix and path selector function for fastclime
### Aliases: fastclime.selector

### ** Examples

#generate data
L = fastclime.generator(n = 100, d = 20)

#graph path estimation
out1 = fastclime(L$data,0.1)
out2 = fastclime.selector(out1$lambdamtx, out1$icovlist,0.2)
fastclime.plot(out2$adaj)



