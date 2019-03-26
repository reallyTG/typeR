library(btergm)


### Name: interpret
### Title: Interpretation functions for ergm and btergm objects
### Aliases: interpret interpret.ergm interpret.btergm interpret.mtergm
###   interpretation interpret-methods interpret,ergm-method
###   interpret,btergm-method interpret,mtergm-method

### ** Examples

##### The following example is a TERGM adaptation of the #####
##### dyad-level example provided in figure 5(c) on page #####
##### 424 of Desmarais and Cranmer (2012) in the PSJ. At #####
##### each time step, it compares dyadic probabilities   #####
##### (no tie, unidirectional tie, and reciprocal tie    #####
##### probability) between a fitted model and a model    #####
##### where the reciprocity effect is fixed at 0 based   #####
##### on 20 randomly selected dyads per time step. The   #####
##### results are visualized using a grouped bar plot.   #####

## Not run: 
##D # create toy dataset and fit a model
##D networks <- list()
##D for (i in 1:3) {           # create 3 random networks with 10 actors
##D   mat <- matrix(rbinom(100, 1, 0.25), nrow = 10, ncol = 10)
##D   diag(mat) <- 0           # loops are excluded
##D   nw <- network(mat)       # create network object
##D   networks[[i]] <- nw      # add network to the list
##D }
##D fit <- btergm(networks ~ edges + istar(2) + mutual, R = 200)
##D 
##D # extract coefficients and create null hypothesis vector
##D null <- coef(fit)  # estimated coefs
##D null[3] <- 0       # set mutual term = 0
##D 
##D # sample 20 dyads per time step and compute probability ratios
##D probabilities <- matrix(nrow = 9, ncol = length(networks))
##D # nrow = 9 because three probabilities + upper and lower CIs
##D colnames(probabilities) <- paste("t =", 1:length(networks))
##D for (t in 1:length(networks)) {
##D   d <- dim(as.matrix(networks[[t]]))  # how many row and column nodes?
##D   size <- d[1] * d[2]                 # size of the matrix
##D   nw <- matrix(1:size, nrow = d[1], ncol = d[2])
##D   nw <- nw[lower.tri(nw)]             # sample only from lower triangle b/c
##D   samp <- sample(nw, 20)              # dyadic probabilities are symmetric
##D   prob.est.00 <- numeric(0)
##D   prob.est.01 <- numeric(0)
##D   prob.est.11 <- numeric(0)
##D   prob.null.00 <- numeric(0)
##D   prob.null.01 <- numeric(0)
##D   prob.null.11 <- numeric(0)
##D   for (k in 1:20) {
##D     i <- arrayInd(samp[k], d)[1, 1]   # recover 'i's and 'j's from sample
##D     j <- arrayInd(samp[k], d)[1, 2]
##D     # run interpretation function with estimated coefs and mutual = 0:
##D     int.est <- interpret(fit, type = "dyad", i = i, j = j, t = t)
##D     int.null <- interpret(fit, coefficients = null, type = "dyad", 
##D         i = i, j = j, t = t)
##D     prob.est.00 <- c(prob.est.00, int.est[[1]][1, 1])
##D     prob.est.11 <- c(prob.est.11, int.est[[1]][2, 2])
##D     mean.est.01 <- (int.est[[1]][1, 2] + int.est[[1]][2, 1]) / 2
##D     prob.est.01 <- c(prob.est.01, mean.est.01)
##D     prob.null.00 <- c(prob.null.00, int.null[[1]][1, 1])
##D     prob.null.11 <- c(prob.null.11, int.null[[1]][2, 2])
##D     mean.null.01 <- (int.null[[1]][1, 2] + int.null[[1]][2, 1]) / 2
##D     prob.null.01 <- c(prob.null.01, mean.null.01)
##D   }
##D   prob.ratio.00 <- prob.est.00 / prob.null.00  # ratio of est. and null hyp
##D   prob.ratio.01 <- prob.est.01 / prob.null.01
##D   prob.ratio.11 <- prob.est.11 / prob.null.11
##D   probabilities[1, t] <- mean(prob.ratio.00)   # mean estimated 00 tie prob
##D   probabilities[2, t] <- mean(prob.ratio.01)   # mean estimated 01 tie prob
##D   probabilities[3, t] <- mean(prob.ratio.11)   # mean estimated 11 tie prob
##D   ci.00 <- t.test(prob.ratio.00, conf.level = 0.99)$conf.int
##D   ci.01 <- t.test(prob.ratio.01, conf.level = 0.99)$conf.int
##D   ci.11 <- t.test(prob.ratio.11, conf.level = 0.99)$conf.int
##D   probabilities[4, t] <- ci.00[1]              # lower 00 conf. interval
##D   probabilities[5, t] <- ci.01[1]              # lower 01 conf. interval
##D   probabilities[6, t] <- ci.11[1]              # lower 11 conf. interval
##D   probabilities[7, t] <- ci.00[2]              # upper 00 conf. interval
##D   probabilities[8, t] <- ci.01[2]              # upper 01 conf. interval
##D   probabilities[9, t] <- ci.11[2]              # upper 11 conf. interval
##D }
##D 
##D # create barplots from probability ratios and CIs
##D require("gplots")
##D bp <- barplot2(probabilities[1:3, ], beside = TRUE, plot.ci = TRUE, 
##D     ci.l = probabilities[4:6, ], ci.u = probabilities[7:9, ], 
##D     col = c("tan", "tan2", "tan3"), ci.col = "grey40", 
##D     xlab = "Dyadic tie values", ylab = "Estimated Prob./Null Prob.")
##D mtext(1, at = bp, text = c("(0,0)", "(0,1)", "(1,1)"), line = 0, cex = 0.5)
##D 
##D 
##D ##### The following examples illustrate the behavior of  #####
##D ##### the interpret function with undirected and/or      #####
##D ##### bipartite graphs with or without structural zeros. #####
##D 
##D library("statnet")
##D library("btergm")
##D 
##D # micro-level interpretation for undirected network with structural zeros
##D set.seed(12345)
##D mat <- matrix(rbinom(400, 1, 0.1), nrow = 20, ncol = 20)
##D mat[1, 5] <- 1
##D mat[10, 7] <- 1
##D mat[15, 3] <- 1
##D mat[18, 4] < 1
##D nw <- network(mat, directed = FALSE, bipartite = FALSE)
##D cv <- matrix(rnorm(400), nrow = 20, ncol = 20)
##D offsetmat <- matrix(rbinom(400, 1, 0.1), nrow = 20, ncol = 20)
##D offsetmat[1, 5] <- 1
##D offsetmat[10, 7] <- 1
##D offsetmat[15, 3] <- 1
##D offsetmat[18, 4] < 1
##D model <- ergm(nw ~ edges + kstar(2) + edgecov(cv) + offset(edgecov(offsetmat)), 
##D     offset.coef = -Inf)
##D summary(model)
##D 
##D # tie-level interpretation (note that dyad interpretation would not make any 
##D # sense in an undirected network):
##D interpret(model, type = "tie", i = 1, j = 2)  # 0.28 (= normal dyad)
##D interpret(model, type = "tie", i = 1, j = 5)  # 0.00 (= structural zero)
##D 
##D # node-level interpretation; note the many 0 probabilities due to the 
##D # structural zeros; also note the warning message that the probabilities may 
##D # be slightly imprecise because -Inf needs to be approximated by some large 
##D # negative number (-9e8):
##D interpret(model, type = "node", i = 1, j = 3:5)
##D 
##D # repeat the same exercise for a directed network
##D nw <- network(mat, directed = TRUE, bipartite = FALSE)
##D model <- ergm(nw ~ edges + istar(2) + edgecov(cv) + offset(edgecov(offsetmat)), 
##D     offset.coef = -Inf)
##D interpret(model, type = "tie", i = 1, j = 2)  # 0.13 (= normal dyad)
##D interpret(model, type = "tie", i = 1, j = 5)  # 0.00 (= structural zero)
##D interpret(model, type = "dyad", i = 1, j = 2)  # results for normal dyad
##D interpret(model, type = "dyad", i = 1, j = 5)  # results for i->j struct. zero
##D interpret(model, type = "node", i = 1, j = 3:5)
##D 
##D # micro-level interpretation for bipartite graph with structural zeros
##D set.seed(12345)
##D mat <- matrix(rbinom(200, 1, 0.1), nrow = 20, ncol = 10)
##D mat[1, 5] <- 1
##D mat[10, 7] <- 1
##D mat[15, 3] <- 1
##D mat[18, 4] < 1
##D nw <- network(mat, directed = FALSE, bipartite = TRUE)
##D cv <- matrix(rnorm(200), nrow = 20, ncol = 10)  # some covariate
##D offsetmat <- matrix(rbinom(200, 1, 0.1), nrow = 20, ncol = 10)
##D offsetmat[1, 5] <- 1
##D offsetmat[10, 7] <- 1
##D offsetmat[15, 3] <- 1
##D offsetmat[18, 4] < 1
##D model <- ergm(nw ~ edges + b1star(2) + edgecov(cv) 
##D     + offset(edgecov(offsetmat)), offset.coef = -Inf)
##D summary(model)
##D 
##D # tie-level interpretation; note the index for the second mode starts with 21
##D interpret(model, type = "tie", i = 1, j = 21)
##D 
##D # dyad-level interpretation does not make sense because network is undirected; 
##D # node-level interpretation prints warning due to structural zeros, but 
##D # computes the correct probabilities (though slightly imprecise because -Inf 
##D # is approximated by some small number:
##D interpret(model, type = "node", i = 1, j = 21:25)
##D 
##D # compute all dyadic probabilities
##D dyads <- edgeprob(model)
##D dyads
## End(Not run)



