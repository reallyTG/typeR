library(Mcomp)


### Name: M3Forecast
### Title: M3-Competition forecasts of original competition participants
### Aliases: M3Forecast
### Keywords: datasets

### ** Examples


M3Forecast[["NAIVE2"]][1,]

## Not run: 
##D # calculate errors using the accuracy function
##D # from the forecast package
##D 
##D errors <- lapply(M3Forecast, function(f) {
##D       res <- NULL
##D       for(x in 1:length(M3)) {
##D         curr_f <- unlist(f[x,])
##D         if(any(!is.na(curr_f))) {
##D           curr_res <- accuracy(curr_f, M3[[x]]$xx)
##D         } else {
##D           # if no results are available create NA results
##D           curr_res <- accuracy(M3[[x]]$xx, M3[[x]]$xx)
##D           curr_res <- rep(NA, length(curr_res))
##D         }
##D         res <- rbind(res, curr_res)
##D       }
##D       rownames(res) <- NULL
##D       res
##D     })
##D 
##D ind_yearly <- which(unlist(lapply(M3, function(x) {x$period == "YEARLY"})))
##D ind_quarterly <- which(unlist(lapply(M3, function(x) {x$period == "QUARTERLY"})))
##D ind_monthly <- which(unlist(lapply(M3, function(x) {x$period == "MONTHLY"})))
##D ind_other <- which(unlist(lapply(M3, function(x) {x$period == "OTHER"})))
##D 
##D yearly_errors <- t(as.data.frame(lapply(errors, function(x) {colMeans(x[ind_yearly,])})))
##D quarterly_errors <- t(as.data.frame(lapply(errors, function(x) {colMeans(x[ind_quarterly,])})))
##D monthly_errors <- t(as.data.frame(lapply(errors, function(x) {colMeans(x[ind_monthly,])})))
##D other_errors <- t(as.data.frame(lapply(errors, function(x) {colMeans(x[ind_other,])})))
##D 
##D yearly_errors
##D quarterly_errors
##D monthly_errors
##D other_errors
## End(Not run)



