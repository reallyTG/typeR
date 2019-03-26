library(greta)


### Name: extract-replace-combine
### Title: extract, replace and combine greta arrays
### Aliases: extract-replace-combine extract replace cbind rbind c rep

### ** Examples

## Not run: 
##D 
##D  x <- as_data(matrix(1:12, 3, 4))
##D 
##D  # extract and replace
##D  x[1:3, ]
##D  x[, 2:4] <- 1:9
##D  e <- diag(x)
##D  diag(x) <- e + 1
##D 
##D  # combine
##D  cbind(x[, 2], x[, 1])
##D  rbind(x[1, ], x[3, ])
##D  abind(x[1, ], x[3, ], along = 1)
##D  c(x[, 1], x)
##D  rep(x[, 2], times = 3)
## End(Not run)



