library(DescTools)


### Name: HodgesLehmann
### Title: Hodges-Lehmann Estimator of Location
### Aliases: HodgesLehmann
### Keywords: nonparametric robust univar

### ** Examples

set.seed(1)
x <- rt(100, df = 3)
HodgesLehmann(x)

# same as
wilcox.test(x,  conf.int = TRUE)$estimate



