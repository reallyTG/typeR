library(ChainLadder)


### Name: glmReserve
### Title: GLM-based Reserving Model
### Aliases: glmReserve plot.glmReserve summary.glmReserve print.glmReserve
###   resid.glmReserve
### Keywords: models

### ** Examples

data(GenIns)
GenIns <- GenIns / 1000

# over-dispersed Poisson: reproduce ChainLadder estimates
(fit1 <- glmReserve(GenIns))
summary(fit1, type = "model")   # extract the underlying glm

# which:
# 1 Original triangle 
# 2 Full triangle 
# 3 Reserve distribution
# 4 Residual plot
# 5 QQ-plot

# plot original triangle
plot(fit1, which = 1, xlab = "dev year", ylab = "cum loss")

# plot residuals 
plot(fit1, which = 4, xlab = "fitted values", ylab = "residuals")

# Gamma GLM:
(fit2 <- glmReserve(GenIns, var.power = 2))

# compound Poisson GLM (variance function estimated from the data):
(fit3 <- glmReserve(GenIns, var.power = NULL))

# Now suppose we have an exposure measure
# we can put it as an offset term in the model
# to do this, use the "exposure" attribute of the 'triangle'
expos <- (7 + 1:10 * 0.4) * 100
GenIns2 <- GenIns
attr(GenIns2, "exposure") <- expos
(fit4 <- glmReserve(GenIns2))
# If the triangle's rownames are not convertible to numeric,
# supply names to the exposures
GenIns3 <- GenIns2
rownames(GenIns3) <- paste0(2007:2016, "-01-01")
names(expos) <- rownames(GenIns3)
attr(GenIns3, "exposure") <- expos
(fit4b <- glmReserve(GenIns3))

# use bootstrapping to compute prediction error
## Not run: 
##D set.seed(11)
##D (fit5 <- glmReserve(GenIns, mse.method = "boot"))
##D 
##D # compute the quantiles of the predicted loss reserves
##D t(apply(fit5$sims.reserve.pred, 2, quantile, 
##D         c(0.025, 0.25, 0.5, 0.75, 0.975)))
##D         
##D # plot distribution of reserve
##D plot(fit5, which = 3)
## End(Not run)

# alternative over-dispersed Poisson: negative binomial GLM
(fit6 <- glmReserve(GenIns, nb = TRUE))




