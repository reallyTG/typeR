library(hts)


### Name: MinT
### Title: Trace minimization for hierarchical or grouped time series
### Aliases: MinT
### Keywords: ts

### ** Examples


# hts example
## Not run: 
##D h <- 12 
##D ally <- aggts(htseg1)
##D n <- nrow(ally)
##D p <- ncol(ally)
##D allf <- matrix(NA, nrow = h, ncol = p)
##D res <- matrix(NA, nrow = n, ncol = p)
##D for(i in 1:p)
##D {
##D   fit <- auto.arima(ally[, i])
##D   allf[, i] <- forecast(fit, h = h)$mean
##D   res[, i] <- na.omit(ally[, i] - fitted(fit))
##D }
##D allf <- ts(allf, start = 51)
##D y.f <- MinT(allf, get_nodes(htseg1), residual = res, covariance = "shr", 
##D   keep = "gts", algorithms = "lu")
##D plot(y.f)
##D y.f_cg <- MinT(allf, get_nodes(htseg1), residual = res, covariance = "shr", 
##D   keep = "all", algorithms = "cg")
## End(Not run)
  
# gts example
## Not run: 
##D abc <- ts(5 + matrix(sort(rnorm(200)), ncol = 4, nrow = 50))
##D g <- rbind(c(1,1,2,2), c(1,2,1,2))
##D y <- gts(abc, groups = g)
##D h <- 12
##D ally <- aggts(y)
##D n <- nrow(ally)
##D p <- ncol(ally)
##D allf <- matrix(NA,nrow = h,ncol = ncol(ally))
##D res <- matrix(NA, nrow = n, ncol = p)
##D for(i in 1:p)
##D {
##D   fit <- auto.arima(ally[, i])
##D   allf[, i] <- forecast(fit, h = h)$mean
##D   res[, i] <- na.omit(ally[, i] - fitted(fit))
##D }
##D allf <- ts(allf, start = 51)
##D y.f <- MinT(allf, groups = get_groups(y), residual = res, covariance = "shr", 
##D   keep = "gts", algorithms = "lu")
##D plot(y.f)
## End(Not run)




