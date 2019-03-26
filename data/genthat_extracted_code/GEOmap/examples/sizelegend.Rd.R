library(GEOmap)


### Name: sizelegend
### Title: Magnitude size legend
### Aliases: sizelegend
### Keywords: misc

### ** Examples



x = rnorm(30)
y = rnorm(30)

mags = runif(30, 1,8)


plot(x, y, type="n")

esiz = exp(mags)
rsiz = RPMG::RESCALE(esiz, .4, 10, min(esiz), max(esiz))
points(x, y, pch=1, cex=rsiz)

am = pretty(mags)
am = am[am>min(mags) & am<max(mags) ]

em = exp(am)
se = RPMG::RESCALE(em, .4, 10, min(esiz), max(esiz))

sizelegend(se, am, pch=1)






