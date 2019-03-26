library(grt)


### Name: dprime
### Title: Calculate d' (d-prime)
### Aliases: dprime dprimef
### Keywords: misc

### ** Examples

data(subjdemo_2d)
d2 <- subjdemo_2d
db <- glcStruct(noise=10, coeffs=c(0.514,-0.857),bias=-0.000154)
dprime(d2[,2:3], d2$category, d2$response, par = db, zlimit=7, type='SampleIdeal')

mc <- mcovs(category ~ x + y, data=d2)
dprimef(mc$means, mc$covs)



