library(VGAM)


### Name: binom2.or
### Title: Bivariate Binary Regression with an Odds Ratio (Family Function)
### Aliases: binom2.or
### Keywords: models regression

### ** Examples

# Fit the model in Table 6.7 in McCullagh and Nelder (1989)
coalminers <- transform(coalminers, Age = (age - 42) / 5)
fit <- vglm(cbind(nBnW, nBW, BnW, BW) ~ Age,
            binom2.or(zero = NULL), data = coalminers)
fitted(fit)
summary(fit)
coef(fit, matrix = TRUE)
c(weights(fit, type = "prior")) * fitted(fit)  # Table 6.8

## Not run: 
##D  with(coalminers, matplot(Age, fitted(fit), type = "l", las = 1,
##D                          xlab = "(age - 42) / 5", lwd = 2))
##D with(coalminers, matpoints(Age, depvar(fit), col=1:4))
##D legend(x = -4, y = 0.5, lty = 1:4, col = 1:4, lwd = 2,
##D        legend = c("1 = (Breathlessness=0, Wheeze=0)",
##D                   "2 = (Breathlessness=0, Wheeze=1)",
##D                   "3 = (Breathlessness=1, Wheeze=0)",
##D                   "4 = (Breathlessness=1, Wheeze=1)")) 
## End(Not run)


# Another model: pet ownership
## Not run: 
##D  data(xs.nz, package = "VGAMdata")
##D # More homogeneous:
##D petdata <- subset(xs.nz, ethnicity == "European" & age < 70 & sex == "M")
##D petdata <- na.omit(petdata[, c("cat", "dog", "age")])
##D summary(petdata)
##D with(petdata, table(cat, dog))  # Can compute the odds ratio
##D 
##D fit <- vgam(cbind((1-cat) * (1-dog), (1-cat) * dog,
##D                      cat  * (1-dog),    cat  * dog) ~ s(age, df = 5),
##D             binom2.or(zero =    3), data = petdata, trace = TRUE)
##D colSums(depvar(fit))
##D coef(fit, matrix = TRUE)
## End(Not run)

## Not run: 
##D  # Plot the estimated probabilities
##D ooo <- order(with(petdata, age))
##D matplot(with(petdata, age)[ooo], fitted(fit)[ooo, ], type = "l",
##D         xlab = "Age", ylab = "Probability", main = "Pet ownership",
##D         ylim = c(0, max(fitted(fit))), las = 1, lwd = 1.5)
##D legend("topleft", col=1:4, lty = 1:4, leg = c("no cat or dog ",
##D        "dog only", "cat only", "cat and dog"), lwd = 1.5) 
## End(Not run)



