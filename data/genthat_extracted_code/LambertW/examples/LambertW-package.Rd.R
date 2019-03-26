library(LambertW)


### Name: LambertW-package
### Title: R package for Lambert W \times F distributions
### Aliases: LambertW LambertW-package
### Keywords: package

### ** Examples

 
# Replicate parts of the analysis in Goerg (2011)
data(AA)
y <- AA[AA$sex=="f", "bmi"]
test_normality(y)

fit.gmm <- IGMM(y, type = "s")
summary(fit.gmm)  # gamma is significant and positive
plot(fit.gmm)

# Compare empirical to theoretical moments (given parameter estimates)
moments.theory <- 
 mLambertW(theta = list(beta = fit.gmm$tau[c("mu_x", "sigma_x")], 
                        gamma = fit.gmm$tau["gamma"]), 
           distname = "normal")
TAB <- rbind(unlist(moments.theory),
             c(mean(y), sd(y), skewness(y), kurtosis(y)))
rownames(TAB) <- c("Theoretical (IGMM)", "Empirical")
TAB

x <- get_input(y, fit.gmm$tau)
test_normality(x) # input is normal -> fit a Lambert W x Gaussian by MLE

fit.ml <- MLE_LambertW(y, type = "s", distname = "normal", hessian = TRUE)
summary(fit.ml)
plot(fit.ml)




