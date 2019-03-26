library(ChainLadder)


### Name: MultiChainLadder
### Title: Multivariate Chain-Ladder Models
### Aliases: MultiChainLadder MultiChainLadder2
### Keywords: models

### ** Examples

# This shows that the MCL model using "OLS" is equivalent to 
# the MackChainLadder when applied to one triangle 

data(GenIns)
(U1 <- MackChainLadder(GenIns, est.sigma = "Mack"))
(U2 <- MultiChainLadder(list(GenIns), fit.method = "OLS"))

# show plots 
parold <- par(mfrow = c(2, 2))
plot(U2, which.plot = 1:4)
plot(U2, which.plot = 5)
par(parold)


# For mse.method = "Independence", the model is equivalent 
# to that in Buchwalder et al. (2006)

(B1 <- MultiChainLadder(list(GenIns), fit.method = "OLS", 
    mse.method = "Independence"))

# use the unbiased residual covariance estimator 
# in Merz and Wuthrich (2008)
(W1 <- MultiChainLadder2(liab, mse.method = "Independence", 
    		control = systemfit::systemfit.control(methodResidCov = "Theil"))) 

## Not run: 
##D # use the iterative residual covariance estimator
##D for (i in 1:5){
##D   W2 <- MultiChainLadder2(liab, mse.method = "Independence", 
##D       control = systemfit::systemfit.control(
##D       methodResidCov = "Theil", maxiter = i))
##D   print(format(summary(W2)@report.summary[[3]][15, 4:5], 
##D           digits = 6, big.mark = ","))    
##D }
##D 
##D # The following fits an MCL model with intercepts for years 1:7
##D # and separate chain-ladder models for the rest periods
##D f1 <- MultiChainLadder2(auto, type = "MCL+int")
##D 
##D # compare with the model without intercepts through residual plots
##D f0 <- MultiChainLadder2(auto, type = "MCL")
##D 
##D parold <- par(mfrow = c(2, 3), mar = c(3, 3, 2, 1))
##D mt <- list(c("Personal Paid", "Personal Incured", "Commercial Paid"))
##D plot(f0, which.plot = 3, main = mt)
##D plot(f1, which.plot = 3, main = mt)
##D par(parold)
##D 
##D ## summary statistics
##D summary(f1, portfolio = "1+3")@report.summary[[4]]
##D 
##D 
##D # model for joint development of paid and incurred triangles 
##D da <- auto[1:2]
##D # MCL with diagonal development
##D M0 <- MultiChainLadder(da)
##D # non-diagonal development matrix with no intercepts
##D M1 <- MultiChainLadder2(da, type = "GMCL-int")
##D # Munich chain-ladder
##D M2 <- MunichChainLadder(da[[1]], da[[2]])
##D # compile results and compare projected paid to incurred ratios
##D r1 <- lapply(list(M0, M1), function(x){
##D           ult <- summary(x)@Ultimate
##D           ult[, 1] / ult[, 2]
##D       })
##D names(r1) <- c("MCL", "GMCL")
##D r2 <- summary(M2)[[1]][, 6]
##D r2 <- c(r2, summary(M2)[[2]][2, 3])
##D print(do.call(cbind, c(r1, list(MuCl = r2))) * 100, digits = 4)
##D 
## End(Not run)

# To reproduce results in Zhang (2010) and see more examples, use:
## Not run: 
##D  demo(MultiChainLadder)
## End(Not run)




