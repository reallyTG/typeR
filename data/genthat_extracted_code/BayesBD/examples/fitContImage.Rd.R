library(BayesBD)


### Name: fitContImage
### Title: Data pre-processing and continuous image analysis
### Aliases: fitContImage

### ** Examples

## Not run: 
##D set.seed(12345)
##D gamma.fun = ellipse(a = 0.35, b = 0.25)
##D norm.obs = parnormobs(m = 100, mu.in = 4, mu.out = 1,
##D  sd.in = 1.5, sd.out = 1, design = 'J',
##D  center = c(0.5,0.5), gamma.fun)
##D norm.samp = fitContImage(image = norm.obs, nrun = 1000, nburn = 0,
##D  J = 10,ordering_mu = "I",ordering_sigma = "I", slice = FALSE, outputAll = FALSE)
##D par(mfrow = c(1,3))
##D plotBD(norm.samp, 1)
##D plotBD(norm.samp, 2)
##D plotBD(norm.samp, 3)
## End(Not run)



