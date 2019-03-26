library(RobLox)


### Name: rlsOptIC.AL
### Title: Computation of the optimally robust IC for AL estimators
### Aliases: rlsOptIC.AL
### Keywords: robust

### ** Examples

IC1 <- rlsOptIC.AL(r = 0.1, check = TRUE)
distrExOptions("ErelativeTolerance" = 1e-12)
checkIC(IC1)
distrExOptions("ErelativeTolerance" = .Machine$double.eps^0.25) # default
Risks(IC1)
cent(IC1)
clip(IC1)
stand(IC1)

## don't run to reduce check time on CRAN
## Not run: 
##D plot(IC1)
##D infoPlot(IC1)
##D 
##D ## k-step estimation
##D ## better use function roblox (see ?roblox)
##D ## 1. data: random sample
##D ind <- rbinom(100, size=1, prob=0.05) 
##D x <- rnorm(100, mean=0, sd=(1-ind) + ind*9)
##D mean(x)
##D sd(x)
##D median(x)
##D mad(x)
##D 
##D ## 2. Kolmogorov(-Smirnov) minimum distance estimator (default)
##D ## -> we use it as initial estimate for one-step construction
##D (est0 <- MDEstimator(x, ParamFamily = NormLocationScaleFamily()))
##D 
##D ## 3.1 one-step estimation: radius known
##D IC1 <- rlsOptIC.AL(r = 0.5, mean = estimate(est0)[1], sd = estimate(est0)[2])
##D (est1 <- oneStepEstimator(x, IC1, est0))
##D 
##D ## 3.2 k-step estimation: radius known
##D ## Choose k = 3
##D (est2 <- kStepEstimator(x, IC1, est0, steps = 3L))
##D 
##D ## 4.1 one-step estimation: radius unknown
##D ## take least favorable radius r = 0.579
##D ## cf. Table 8.1 in Kohl(2005)
##D IC2 <- rlsOptIC.AL(r = 0.579, mean = estimate(est0)[1], sd = estimate(est0)[2])
##D (est3 <- oneStepEstimator(x, IC2, est0))
##D 
##D ## 4.2 k-step estimation: radius unknown
##D ## take least favorable radius r = 0.579
##D ## cf. Table 8.1 in Kohl(2005)
##D ## choose k = 3
##D (est4 <- kStepEstimator(x, IC2, est0, steps = 3L))
## End(Not run)



