library(pirate)


### Name: effectSize
### Title: Effect Size Calculation
### Aliases: effectSize

### ** Examples

#constructing the covariance matrix
co <- matrix(0.2, 10, 10)
diag(co) <- 1
dataEx <- data_generator1(d = 0.3, R2 = 0.5, v2 = 1, n = 3000,
                    co = co, beta1 = rep(1,10),inter = c(0,0))
#fit the GEM
dat <- dataEx[[1]]
model_nu <- gem_fit(dat = dat, method = "nu")
augmentData <- model_nu[[4]]
es <- effectSize(augmentData$y, augmentData$trt, augmentData$Z) 
#this should be the same with effect size calculated by the gem_fit function



