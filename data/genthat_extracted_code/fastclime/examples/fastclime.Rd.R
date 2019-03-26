library(fastclime)


### Name: fastclime
### Title: The main solver for fastclime package
### Aliases: fastclime

### ** Examples

#generate data
L = fastclime.generator(n = 100, d = 20)

#graph path estimation
out1 = fastclime(L$data,0.1)
out2 = fastclime.selector(out1$lambdamtx, out1$icovlist,0.2)
fastclime.plot(out2$adaj)

#graph path estimation using the sample covariance matrix as the input.
out1 = fastclime(cor(L$data),0.1)
out2 = fastclime.selector(out1$lambdamtx, out1$icovlist,0.2)
fastclime.plot(out2$adaj)



