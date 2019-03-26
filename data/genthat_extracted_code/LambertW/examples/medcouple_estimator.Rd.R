library(LambertW)


### Name: medcouple_estimator
### Title: MedCouple Estimator
### Aliases: medcouple_estimator
### Keywords: univar

### ** Examples


# a simulation
kNumSim <- 100
kNumObs <- 200

################# Gaussian (Symmetric) #### 
A <- t(replicate(kNumSim, {xx <- rnorm(kNumObs); c(skewness(xx), medcouple_estimator(xx))}))
########### skewed LambertW x Gaussian #### 
tau.s <- gamma_01(0.2) # zero mean, unit variance, but positive skewness
rbind(mLambertW(theta = list(beta = tau.s[c("mu_x", "sigma_x")], 
                             gamma = tau.s["gamma"]), 
                distname="normal"))
B <- t(replicate(kNumSim, 
                 {
                   xx <- rLambertW(n = kNumObs, 
                                   theta = list(beta = tau.s[c("mu_x", "sigma_x")], 
                                                gamma = tau.s["gamma"]), 
                                   distname="normal")
                   c(skewness(xx), medcouple_estimator(xx))
                 }))
                  
colnames(A) <- colnames(B) <- c("MedCouple", "Pearson Skewness")

layout(matrix(1:4, ncol = 2))
plot(A, main = "Gaussian")
boxplot(A)
abline(h = 0)

plot(B, main = "Skewed Lambert W x Gaussian")
boxplot(B)
abline(h = mLambertW(theta = list(beta = tau.s[c("mu_x", "sigma_x")], 
                                  gamma = tau.s["gamma"]), 
                     distname="normal")["skewness"])

colMeans(A)
apply(A, 2, sd)

colMeans(B)
apply(B, 2, sd)




