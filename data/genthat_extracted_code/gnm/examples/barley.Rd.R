library(gnm)


### Name: barley
### Title: Jenkyn's Data on Leaf-blotch on Barley
### Aliases: barley
### Keywords: datasets

### ** Examples

set.seed(1)

###  Fit Wedderburn's logit model with variance proportional to [mu(1-mu)]^2
logitModel <- glm(y ~ site + variety, family = wedderburn, data = barley)
fit <- fitted(logitModel)
print(sum((barley$y - fit)^2 / (fit * (1-fit))^2))
##  Agrees with the chi-squared value reported in McCullagh and Nelder 
##  (1989, p331), which differs slightly from Wedderburn's reported value.

###  Fit the biplot model as in Gabriel (1998, p694)
biplotModel <- gnm(y ~ -1 + instances(Mult(site, variety), 2),
                   family = wedderburn, data = barley)
barleySVD <- svd(matrix(biplotModel$predictors, 10, 9))
A <- sweep(barleySVD$v, 2, sqrt(barleySVD$d), "*")[, 1:2]
B <- sweep(barleySVD$u, 2, sqrt(barleySVD$d), "*")[, 1:2]
##  These are essentially A and B as in Gabriel (1998, p694), from which
##  the biplot is made by
plot(rbind(A, B), pch = c(levels(barley$site), levels(barley$variety)))

##  Fit the double-additive model as in Gabriel (1998, p697)
variety.binary <- factor(match(barley$variety, c(2,3,6), nomatch = 0) > 0,
                        labels = c("rest", "2,3,6"))
doubleAdditive <- gnm(y ~ variety + Mult(site, variety.binary),
                      family = wedderburn, data = barley)
##  It is unclear why Gabriel's chi-squared statistics differ slightly
##  from the ones produced in these fits.  Possibly Gabriel adjusted the
##  data somehow prior to fitting?



