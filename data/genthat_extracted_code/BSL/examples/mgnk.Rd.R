library(BSL)


### Name: mgnk
### Title: The multivariate G&K example
### Aliases: mgnk mgnk_sim mgnk_sum

### ** Examples

## No test: 
require(doParallel) # You can use a different package to set up the parallel backend
require(MASS)
require(elliplot)

# Loading the data for this example
data(mgnk)

# Performing BSL (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultMgnkBSL <- bsl(mgnk$data, n = 60, M = 80000, theta0 = mgnk$start, covRandWalk = mgnk$cov,
    fnSim = mgnk_sim, fnSum = mgnk_sum, simArgs = mgnk$sim_options,
    parallel = TRUE, parallelArgs = list(.packages = c('BSL', 'MASS'), .export = 'ninenum'),
    thetaNames = expression(a[1],b[1],g[1],k[1],a[2],b[2],g[2],k[2],a[3],b[3],g[3],k[3],
        delta[12],delta[13],delta[23]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultMgnkBSL)
summary(resultMgnkBSL)
plot(resultMgnkBSL, which = 2, thin = 20)

# Performing tuning for BSLasso
lambda_all <- list(exp(seq(-2.5,0.5,length.out=20)), exp(seq(-2.5,0.5,length.out=20)),
                   exp(seq(-4,-0.5,length.out=20)), exp(seq(-5,-2,length.out=20)))

# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
sp_mgnk <- selectPenalty(ssy = mgnk_sum(mgnk$data), n = c(15, 20, 30, 50), lambda_all,
    theta = mgnk$start, M = 100, sigma = 1.5, fnSim = mgnk_sim,
    fnSum = mgnk_sum, simArgs = mgnk$sim_options, standardise = TRUE,
    parallelSim = TRUE, parallelSimArgs = list(.packages = c('BSL', 'MASS'), .export = 'ninenum'),
    parallelMain = TRUE)
stopCluster(cl)
registerDoSEQ()
sp_mgnk
plot(sp_mgnk)

# Performing BSLasso with a fixed penalty (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultMgnkBSLasso <- bsl(mgnk$data, n = 20, M = 80000, theta0 = mgnk$start, covRandWalk = mgnk$cov,
     fnSim = mgnk_sim, fnSum = mgnk_sum, simArgs = mgnk$sim_options,
     penalty = 0.3, standardise = TRUE, parallel = TRUE,
     parallelArgs = list(.packages = c('BSL', 'MASS'), .export = 'ninenum'),
     thetaNames = expression(a[1],b[1],g[1],k[1],a[2],b[2],g[2],k[2],a[3],b[3],g[3],k[3],
         delta[12],delta[13],delta[23]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultMgnkBSLasso)
summary(resultMgnkBSLasso)
plot(resultMgnkBSLasso, which = 2, thin = 20)


# Performing semiBSL (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultMgnkSemiBSL <- bsl(mgnk$data, n = 60, M = 80000, theta0 = mgnk$start, covRandWalk = mgnk$cov,
    fnSim = mgnk_sim, fnSum = mgnk_sum, simArgs = mgnk$sim_options, method = 'semiBSL',
    parallel = TRUE, parallelArgs = list(.packages = c('BSL', 'MASS'), .export = 'ninenum'),
    thetaNames = expression(a[1],b[1],g[1],k[1],a[2],b[2],g[2],k[2],a[3],b[3],g[3],k[3],
        delta[12],delta[13],delta[23]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultMgnkSemiBSL)
summary(resultMgnkSemiBSL)
plot(resultMgnkSemiBSL, which = 2, thin = 20)

# Plotting the results together for comparison
# plot using the R default plot function
par(mar = c(4, 4, 1, 1), oma = c(0, 1, 2, 0))
combinePlotsBSL(list(resultMgnkBSL, resultMgnkBSLasso, resultMgnkSemiBSL), which = 1, thin = 20,
    label = c('bsl', 'bslasso', 'semiBSL'), col = c('red', 'blue', 'green'), lty = 2:4, lwd = 1)
mtext('Approximate Univariate Posteriors', outer = TRUE, line = 0.75, cex = 1.2)

# plot using the ggplot2 package
combinePlotsBSL(list(resultMgnkBSL, resultMgnkBSLasso, resultMgnkSemiBSL), which = 2, thin = 20,
    label=c('bsl   ','bslasso   ','semiBSL'),
    options.color=list(values=c('red','blue','green')),
    options.linetype = list(values = 2:4), options.size = list(values = rep(1, 3)),
    options.theme = list(plot.margin = grid::unit(rep(0.03,4),"npc"),
    axis.title = ggplot2::element_text(size=12), axis.text = ggplot2::element_text(size = 8),
    legend.text = ggplot2::element_text(size = 12)))
## End(No test)




