library(logcondens)


### Name: logConROC
### Title: Compute ROC curve based on log-concave estimates for the
###   constituent distributions
### Aliases: logConROC
### Keywords: nonparametric

### ** Examples

## ROC curve for pancreas data 
data(pancreas)
status <- factor(pancreas[, "status"], levels = 0:1, 
    labels = c("healthy", "diseased"))
var <- log(pancreas[, "ca199"])
cases <- var[status == "diseased"]
controls <- var[status == "healthy"]

## compute and plot empirical ROC curve
## code modified from https://stat.ethz.ch/pipermail/r-help/2008-October/178531.html
xx <- c(-Inf, sort(unique(c(cases, controls))), Inf)
sens <- sapply(xx, function(x){mean(cases >= x)})  
spec <- sapply(xx, function(x){mean(controls < x)})

## compute log-concave ROC curve
grid <- seq(0, 1, by = 1 / 500)
roc.logcon <- logConROC(cases, controls, grid)        

## plot
plot(0, 0, xlim = c(0, 1), ylim = c(0, 1), type = 'l', 
    main = "ROC curves for pancreas data", xlab = "1 - specificity", 
    ylab = "sensitivity", pty = 's')
legend("bottomright", c("empirical ROC", "log-concave ROC", "smooth log-concave ROC"), 
    lty = c(1, 1, 2), lwd = 2, col = 2:4, bty = "n")
segments(0, 0, 1, 1, col = 1)
lines(1 - spec, sens, type = 'l', col = 2, lwd = 2)
lines(grid, roc.logcon$fROC, col = 3, lwd = 2)
lines(grid, roc.logcon$fROC.smooth, col = 4, lwd = 2, lty = 2)

## Not run: 
##D ## bootstrap confidence intervals at 1 - specificity = 0.2 and 0.8:
##D res <- confIntBootLogConROC_t0(controls, cases, grid = c(0.2, 0.8), conf.level = 0.95, 
##D     M = 1000, smooth = TRUE, output = TRUE)
##D res
## End(Not run)



