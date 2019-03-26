library(vegan)


### Name: renyi
### Title: Renyi and Hill Diversities and Corresponding Accumulation Curves
### Aliases: renyi plot.renyi renyiaccum plot.renyiaccum persp.renyiaccum
### Keywords: univar

### ** Examples

data(BCI)
i <- sample(nrow(BCI), 12)
mod <- renyi(BCI[i,])
plot(mod)
mod <- renyiaccum(BCI[i,])
plot(mod, as.table=TRUE, col = c(1, 2, 2))
persp(mod)



