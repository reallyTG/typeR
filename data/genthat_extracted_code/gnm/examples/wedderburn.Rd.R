library(gnm)


### Name: wedderburn
### Title: Wedderburn Quasi-likelihood Family
### Aliases: wedderburn
### Keywords: models

### ** Examples

set.seed(1)
###  Use data from Wedderburn (1974), see ?barley

###  Fit Wedderburn's logit model with variance proportional to the
###  square of mu(1-mu)
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
plot(rbind(A, B), pch = c(LETTERS[1:9], as.character(1:9), "X"))

###  Fit the double-additive model as in Gabriel (1998, p697)
variety.binary <- factor(match(barley$variety, c(2,3,6), nomatch = 0) > 0,
                         labels = c("Rest", "2,3,6"))
doubleAdditive <- gnm(y ~ variety + Mult(site, variety.binary),
                      family = wedderburn, data = barley)



