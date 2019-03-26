library(MplusAutomation)


### Name: long2LGMM
### Title: Long data to wide latent growth mixture model
### Aliases: long2LGMM

### ** Examples

## Not run: 
##D ## Simulate Some Data from 3 classes
##D library(MASS)
##D set.seed(1234)
##D allcoef <- rbind(
##D   cbind(1, mvrnorm(n = 200,
##D                    mu = c(0, 2, 0),
##D                    Sigma = diag(c(.2, .1, .01)),
##D                    empirical = TRUE)),
##D   cbind(2, mvrnorm(n = 200,
##D                    mu = c(-3.35, 2, 2),
##D                    Sigma = diag(c(.2, .1, .1)),
##D                    empirical = TRUE)),
##D   cbind(3, mvrnorm(n = 200,
##D                    mu = c(3.35, 2, -2),
##D                    Sigma = diag(c(.2, .1, .1)),
##D                    empirical = TRUE)))
##D allcoef <- as.data.frame(allcoef)
##D names(allcoef) <- c("Class", "I", "L", "Q")
##D allcoef$ID <- 1:nrow(allcoef)
##D d <- do.call(rbind, lapply(1:nrow(allcoef), function(i) {
##D   out <- data.frame(
##D     ID = allcoef$ID[i],
##D     Class = allcoef$Class[i],
##D     Assess = 1:11,
##D     x = sort(runif(n = 11, min = -2, max = 2)))
##D   out$y <- rnorm(11,
##D     mean = allcoef$I[i] + allcoef$L[i] * out$x + allcoef$Q[i] * out$x^2,
##D     sd = .1)
##D   return(out)
##D }))
##D 
##D ## create splines
##D library(splines)
##D time_splines <- ns(d$x, df = 3, Boundary.knots = quantile(d$x, probs = c(.02, .98)))
##D d$t1 <- time_splines[, 1]
##D d$t2 <- time_splines[, 2]
##D d$t3 <- time_splines[, 3]
##D d$xq <- d$x^2
##D 
##D ## create new data to be used for predictions
##D nd <- data.frame(ID = 1,
##D                  x = seq(from = -2, to = 2, by = .1))
##D nd.splines <- with(attributes(time_splines),
##D                    ns(nd$x, df = degree, knots = knots,
##D                       Boundary.knots = Boundary.knots))
##D nd$t1 <- nd.splines[, 1]
##D nd$t2 <- nd.splines[, 2]
##D nd$t3 <- nd.splines[, 3]
##D nd$xq <- nd$x^2
##D 
##D ## create a tuning grid of models to try
##D ## all possible combinations are created of different time trends
##D ## different covariance structures of the random effects
##D ## and different number of classes
##D tuneGrid <- expand.grid(
##D   dv = "y",
##D   timevars = list(c("t1", "t2", "t3"), "x", c("x", "xq")),
##D   starts = "2 1",
##D   cov = c("independent", "zero"),
##D   k = c(1L, 3L),
##D   processors = 1L, run = TRUE,
##D   misstrick = TRUE, stringsAsFactors = FALSE)
##D tuneGrid$title <- paste0(
##D   c("linear", "quad", "spline")[sapply(tuneGrid$timevars, length)],
##D   "_",
##D   sapply(tuneGrid$cov, function(x) if(nchar(x)==4) substr(x, 1, 4) else substr(x, 1, 3)),
##D   "_",
##D   tuneGrid$k)
##D tuneGrid$base <- paste0(
##D   c("linear", "quad", "spline")[sapply(tuneGrid$timevars, length)],
##D   "_",
##D   sapply(tuneGrid$cov, function(x) if(nchar(x)==4) substr(x, 1, 4) else substr(x, 1, 3)))
##D 
##D ## example using long2LGMM to fit one model at a time
##D mres <- long2LGMM(
##D         data = d,
##D         idvar = "ID",
##D         assessmentvar = "Assess",
##D         dv = tuneGrid$dv[1],
##D         timevars = tuneGrid$timevars[[1]],
##D         misstrick = tuneGrid$misstrick[1],
##D         k = tuneGrid$k[1],
##D         title = paste0(tuneGrid$title[1], tuneGrid$k[1]),
##D         base = tuneGrid$base[1],
##D         run = tuneGrid$run[1],
##D         processors = tuneGrid$processors[1],
##D         starts = tuneGrid$starts[1],
##D         newdata = nd,
##D         cov = tuneGrid$cov[1])
##D 
##D rm(mres)
## End(Not run)



