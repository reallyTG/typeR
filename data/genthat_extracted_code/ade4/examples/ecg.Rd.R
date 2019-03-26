library(ade4)


### Name: ecg
### Title: Electrocardiogram data
### Aliases: ecg
### Keywords: datasets

### ** Examples

## Not run: 
##D # figure 130 in Percival and Walden (2000)
##D if (requireNamespace("waveslim") == TRUE) { 
##D data(ecg)
##D ecg.level <- haar2level(ecg)
##D ecg.haar <- orthobasis.haar(length(ecg))
##D ecg.mld <- mld(ecg, ecg.haar, ecg.level, plot = FALSE)
##D res <- cbind.data.frame(apply(ecg.mld[,1:5],1,sum), ecg.mld[,6:11])
##D par(mfrow = c(8,1))
##D par(mar = c(2, 5, 1.5, 0.6))
##D plot(as.ts(ecg), ylab = "ECG")
##D apply(res, 2, function(x) plot(as.ts(x), ylim = range(res),
##D  ylab = ""))
##D par(mfrow = c(1,1))
##D }
## End(Not run)



