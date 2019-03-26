library(ICSNP)


### Name: hl.loc
### Title: Hodges - Lehmann Estimator of Location
### Aliases: hl.loc
### Keywords: nonparametric robust univar

### ** Examples

set.seed(1)
x <- rt(100, df = 3)
hl.loc(x)
# same as
wilcox.test(x,  conf.int = TRUE)$estimate
rm(.Random.seed)



