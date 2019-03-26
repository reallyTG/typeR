library(simr)


### Name: extend
### Title: Extend a longitudinal model.
### Aliases: extend

### ** Examples

fm <- lmer(y ~ x + (1|g), data=simdata)
nrow(example)
fmx1 <- extend(fm, along="x", n=20)
nrow(getData(fmx1))
fmx2 <- extend(fm, along="x", values=c(1,2,4,8,16))
nrow(getData(fmx2))




