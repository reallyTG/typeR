library(BSL)


### Name: cell
### Title: Cell biology example
### Aliases: cell cell_sim cell_sum cell_prior

### ** Examples

## No test: 
require(doParallel) # You can use a different package to set up the parallel backend

# Loading the data for this example
data(cell)
true_cell <- c(0.35, 0.001)

# Performing BSL (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultCellBSL <- bsl(cell$data, n = 5000, M = 10000, theta0 = cell$start, covRandWalk = cell$cov,
                     fnSim = cell_sim, fnSum = cell_sum, fnPrior = cell_prior,
                     simArgs = cell$sim_options, sumArgs = cell$sum_options,
                     parallel = TRUE, parallelArgs = list(.packages = 'BSL'),
                     thetaNames = expression(P[m], P[p]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultCellBSL)
summary(resultCellBSL)
plot(resultCellBSL, thetaTrue = true_cell, thin = 20)

# Performing tuning for BSLasso
lambda_all <- list(exp(seq(0.5,2.5,length.out=20)), exp(seq(0,2,length.out=20)),
                   exp(seq(-1,1,length.out=20)), exp(seq(-1,1,length.out=20)))
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
sp_cell <- selectPenalty(ssy = cell_sum(cell$data, cell$sum_options$Yinit),
                         n = c(500, 1000, 1500, 2000), lambda_all, theta = true_cell,
                         M = 100, sigma = 1.5, fnSim = cell_sim,
                         fnSum = cell_sum, simArgs = cell$sim_options,
                         sumArgs = cell$sum_options, parallelSim = TRUE,
                         parallelSimArgs = list(.packages = 'BSL'), parallelMain = TRUE)
stopCluster(cl)
registerDoSEQ()
sp_cell
plot(sp_cell)

# Performing BSLasso with a fixed penalty (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultCellBSLasso <- bsl(cell$data, n = 1500, M = 10, theta0 = cell$start,
                         covRandWalk = cell$cov, fnSim = cell_sim, fnSum = cell_sum,
                         shrinkage = 'glasso', penalty = 1.3, fnPrior = cell_prior,
                         simArgs = cell$sim_options, sumArgs = cell$sum_options,
                         parallel = TRUE, parallelArgs = list(.packages = 'BSL'),
                         thetaNames = expression(P[m], P[p]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultCellBSLasso)
summary(resultCellBSLasso)
plot(resultCellBSLasso, thetaTrue = true_cell, thin = 20)

# Performing semiBSL (reduce the number of iterations M if desired)
# Opening up the parallel pools using doParallel
cl <- makeCluster(detectCores() - 1)
registerDoParallel(cl)
resultCellSemiBSL <- bsl(cell$data, n = 5000, M = 10000, theta0 = cell$start,
                         covRandWalk = cell$cov, fnSim = cell_sim, fnSum = cell_sum,
                         method = 'semiBSL', fnPrior = cell_prior,
                         simArgs = cell$sim_options, sumArgs = cell$sum_options,
                         parallel = TRUE, parallelArgs = list(.packages = 'BSL'),
                         thetaNames = expression(P[m], P[p]), verbose = TRUE)
stopCluster(cl)
registerDoSEQ()
show(resultCellSemiBSL)
summary(resultCellSemiBSL)
plot(resultCellSemiBSL, thetaTrue = true_cell, thin = 20)

# Plotting the results together for comparison
# plot using the R default plot function
par(mar = c(5, 4, 1, 2), oma = c(0, 1, 2, 0))
combinePlotsBSL(list(resultCellBSL, resultCellBSLasso, resultCellSemiBSL),
    which = 1, thetaTrue = true_cell, thin = 20, label = c('bsl', 'bslasso', 'semiBSL'),
    col = c('red', 'blue', 'green'), lty = 2:4, lwd = 1)
mtext('Approximate Univariate Posteriors', outer = TRUE, cex = 1.5)

# plot using the ggplot2 package
combinePlotsBSL(list(resultCellBSL, resultCellBSLasso, resultCellSemiBSL),
    which = 2, thetaTrue = true_cell, thin = 20, label = c('bsl   ', 'bslasso   ', 'semiBSL'),
    options.color = list(values=c('red', 'blue', 'green')),
    options.linetype = list(values = 2:4), options.size = list(values = rep(1, 3)),
    options.theme = list(plot.margin = grid::unit(rep(0.03,4),"npc"),
    axis.title = ggplot2::element_text(size=12), axis.text = ggplot2::element_text(size = 8), 
    legend.text = ggplot2::element_text(size = 12)))

## End(No test)




