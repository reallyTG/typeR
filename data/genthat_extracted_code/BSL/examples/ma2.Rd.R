library(BSL)


### Name: ma2
### Title: An MA(2) model
### Aliases: ma2 ma2_sim ma2_sum ma2_prior

### ** Examples

## No test: 
# Loading the data for this example
data(ma2)
true_ma2 <- c(0.6,0.2)

# Performing BSL (reduce the number of iterations M if desired)
resultMa2BSL <- bsl(y = ma2$data, n = 500, M = 300000, theta0 = ma2$start, covRandWalk = ma2$cov,
    fnSim = ma2_sim, fnSum = ma2_sum, fnPrior = ma2_prior, simArgs = ma2$sim_options,
    thetaNames = expression(theta[1], theta[2]), verbose = TRUE)
show(resultMa2BSL)
summary(resultMa2BSL)
plot(resultMa2BSL, which = 1, thetaTrue = true_ma2, thin = 20)

# Performing tuning for BSLasso
lambda_all <- list(exp(seq(-3,0.5,length.out=20)), exp(seq(-4,-0.5,length.out=20)),
                   exp(seq(-5.5,-1.5,length.out=20)), exp(seq(-7,-2,length.out=20)))
sp_ma2 <- selectPenalty(ssy = ma2_sum(ma2$data), n = c(50, 150, 300, 500), lambda_all,
                        theta = true_ma2, M = 100, sigma = 1.5, fnSim = ma2_sim,
                        fnSum = ma2_sum, simArgs = ma2$sim_options)
sp_ma2
plot(sp_ma2)

# Performing BSLasso with a fixed penalty (reduce the number of iterations M if desired)
resultMa2BSLasso <- bsl(y = ma2$data, n = 300, M = 250000, theta0 = ma2$start, covRandWalk=ma2$cov,
    fnSim = ma2_sim, fnSum = ma2_sum, shrinkage = 'glasso', penalty = 0.027, fnPrior = ma2_prior,
    simArgs = ma2$sim_options, thetaNames = expression(theta[1], theta[2]), verbose = TRUE)
show(resultMa2BSLasso)
summary(resultMa2BSLasso)
plot(resultMa2BSLasso, which = 1, thetaTrue = true_ma2, thin = 20)

# Performing semiBSL (reduce the number of iterations M if desired)
resultMa2SemiBSL <- bsl(y = ma2$data, n = 500, M = 300000, theta0 = ma2$start, covRandWalk=ma2$cov,
                        fnSim = ma2_sim, fnSum = ma2_sum, method = 'semiBSL', fnPrior = ma2_prior,
                        simArgs = ma2$sim_options, thetaNames = expression(theta[1], theta[2]),
                        verbose = TRUE)
show(resultMa2SemiBSL)
summary(resultMa2SemiBSL)
plot(resultMa2SemiBSL, which = 1, thetaTrue = true_ma2, thin = 20)

# Plotting the results together for comparison
# plot using the R default plot function
par(mar = c(5, 4, 1, 2), oma = c(0, 1, 2, 0))
combinePlotsBSL(list(resultMa2BSL, resultMa2BSLasso, resultMa2SemiBSL), which = 1,
    thetaTrue = true_ma2, thin = 20, label = c('bsl', 'bslasso', 'semiBSL'),
    col = c('red', 'blue', 'green'), lty = 2:4, lwd = 1)
mtext('Approximate Univariate Posteriors', outer = TRUE, cex = 1.5)

# plot using the ggplot2 package
combinePlotsBSL(list(resultMa2BSL, resultMa2BSLasso, resultMa2SemiBSL), which = 2,
    thetaTrue = true_ma2, thin = 20, label = c('bsl   ', 'bslasso   ', 'semiBSL'),
    options.color = list(values=c('red', 'blue', 'green')),
    options.linetype = list(values = 2:4), options.size = list(values = rep(1, 3)),
    options.theme = list(plot.margin = grid::unit(rep(0.03,4), "npc"),
    axis.title = ggplot2::element_text(size=12), axis.text = ggplot2::element_text(size = 8),
    legend.text = ggplot2::element_text(size = 12)))
## End(No test)




