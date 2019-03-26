library(pirate)


### Name: gem_fit
### Title: GEM Fit
### Aliases: gem_fit

### ** Examples

#constructing the covariance matrix
co <- matrix(0.2, 10, 10)
diag(co) <- 1
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 300,
                        co = co, beta1 = rep(1,10),inter = c(0,0))
#fit the GEM
dat <- dataEx[[1]]
model_nu <- gem_fit(dat = dat, method = "nu")
model_de <- gem_fit(dat = dat, method = "de")
model_F <- gem_fit(dat = dat, method = "F")



