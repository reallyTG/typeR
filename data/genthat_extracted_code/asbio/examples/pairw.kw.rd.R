library(asbio)


### Name: pairw.kw
### Title: Multiple pairwise comparison procedure to accompany a
###   Kruskal-Wallis test
### Aliases: pairw.kw KW.multi.comp
### Keywords: univar htest

### ** Examples

rye.data <- data.frame(rye = c(50, 49.8, 52.3, 44.5, 62.3, 74.8, 72.5, 80.2, 
47.6, 39.5, 47.7,50.7), nutrient = factor(c(rep(1, 4), rep(2, 4), rep(3, 4))))
kw <- with(rye.data, pairw.kw(y = rye, x = nutrient, conf = .95))
kw
plot(kw, loc.meas = median, int = "IQR")
# you can also try: plot(kw, type = 2)



