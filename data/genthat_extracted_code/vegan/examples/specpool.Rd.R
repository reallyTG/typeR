library(vegan)


### Name: specpool
### Title: Extrapolated Species Richness in a Species Pool
### Aliases: specpool specpool2vect poolaccum summary.poolaccum
###   plot.poolaccum estimateR estimateR.default estimateR.matrix
###   estimateR.data.frame estaccumR
### Keywords: univar

### ** Examples

data(dune)
data(dune.env)
pool <- with(dune.env, specpool(dune, Management))
pool
op <- par(mfrow=c(1,2))
boxplot(specnumber(dune) ~ Management, data = dune.env,
        col = "hotpink", border = "cyan3")
boxplot(specnumber(dune)/specpool2vect(pool) ~ Management,
        data = dune.env, col = "hotpink", border = "cyan3")
par(op)
data(BCI)
## Accumulation model
pool <- poolaccum(BCI)
summary(pool, display = "chao")
plot(pool)
## Quantitative model
estimateR(BCI[1:5,])



