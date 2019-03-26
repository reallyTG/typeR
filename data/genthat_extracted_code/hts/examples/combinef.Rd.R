library(hts)


### Name: combinef
### Title: Optimally combine forecasts from a hierarchical or grouped time
###   series
### Aliases: combinef
### Keywords: ts

### ** Examples


# hts example
## Not run: 
##D h <- 12
##D ally <- aggts(htseg1)
##D allf <- matrix(NA, nrow = h, ncol = ncol(ally))
##D for(i in 1:ncol(ally))
##D 	allf[,i] <- forecast(auto.arima(ally[,i]), h = h)$mean
##D allf <- ts(allf, start = 51)
##D y.f <- combinef(allf, get_nodes(htseg1), weights = NULL, keep = "gts", algorithms = "lu")
##D plot(y.f)
## End(Not run)

# gts example
## Not run: 
##D abc <- ts(5 + matrix(sort(rnorm(200)), ncol = 4, nrow = 50))
##D g <- rbind(c(1,1,2,2), c(1,2,1,2))
##D y <- gts(abc, groups = g)
##D h <- 12
##D ally <- aggts(y)
##D allf <- matrix(NA,nrow = h,ncol = ncol(ally))
##D for(i in 1:ncol(ally))
##D   allf[,i] <- forecast(auto.arima(ally[,i]),h = h)$mean
##D allf <- ts(allf, start = 51)
##D y.f <- combinef(allf, groups = get_groups(y), keep ="gts", algorithms = "lu")
##D plot(y.f)
## End(Not run)




