library(fda.usc)


### Name: rdir.pc
### Title: Data-driven sampling of random directions guided by sample of
###   functional data
### Aliases: rdir.pc

### ** Examples

# Simulate some data
set.seed(345673)
X.fdata <- r.ou(n = 200, mu = 0, alpha = 1, sigma = 2, t = seq(0, 1, l = 201), 
                x0 = rep(0, 200))
pc <- fdata2pc(X.fdata, ncomp = 20)

# Samples
set.seed(34567)
rdir.pc(n = 5, X.fdata = X.fdata, zero.mean = FALSE)$data[, 1:5]
set.seed(34567)
rdir.pc(n = 5, X.fdata = X.fdata, fdata2pc.obj = pc)$data[, 1:5]

## Not run: 
##D # Comparison for the variance type
##D set.seed(456732)
##D n.proj <- 100
##D set.seed(456732)
##D samp1 <- rdir.pc(n = n.proj, X.fdata = X.fdata, sd = 1, norm = FALSE, ncomp = 0.99)
##D set.seed(456732)
##D samp2 <- rdir.pc(n = n.proj, X.fdata = X.fdata, sd = 0, norm = FALSE, ncomp = 0.99)
##D set.seed(456732)
##D samp3 <- rdir.pc(n = n.proj, X.fdata = X.fdata, sd = 1, norm = TRUE, ncomp = 0.99)
##D set.seed(456732)
##D samp4 <- rdir.pc(n = n.proj, X.fdata = X.fdata, sd = 0, norm = TRUE, ncomp = 0.99)
##D par(mfrow = c(1, 2))
##D plot(X.fdata, col = gray(0.85), lty = 1)
##D lines(samp1[1:10], col = 2, lty = 1)
##D lines(samp2[1:10], col = 4, lty = 1)
##D legend("topleft", legend = c("Data", "Different variances", "Equal variances"), 
##D        col = c(gray(0.85), 2, 4), lwd = 2)
##D plot(X.fdata, col = gray(0.85), lty = 1)
##D lines(samp3[1:10], col = 5, lty = 1)
##D lines(samp4[1:10], col = 6, lty = 1)
##D legend("topleft", legend = c("Data", "Different variances, normalized", 
##D        "Equal variances, normalized"), col = c(gray(0.85), 5:6), lwd = 2)
##D 
##D # Correlations (stronger with different variances and unnormalized; 
##D # stronger with lower ncomp)
##D ind <- lower.tri(matrix(nrow = n.proj, ncol = n.proj))
##D median(abs(cor(sapply(1:n.proj, function(i) inprod.fdata(X.fdata, samp1[i]))))[ind])
##D median(abs(cor(sapply(1:n.proj, function(i) inprod.fdata(X.fdata, samp2[i]))))[ind])
##D median(abs(cor(sapply(1:n.proj, function(i) inprod.fdata(X.fdata, samp3[i]))))[ind])
##D median(abs(cor(sapply(1:n.proj, function(i) inprod.fdata(X.fdata, samp4[i]))))[ind])
##D 
##D # Comparison for the threshold
##D samp1 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.25, fdata2pc.obj = pc)
##D samp2 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.50, fdata2pc.obj = pc)
##D samp3 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.90, fdata2pc.obj = pc)
##D samp4 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.95, fdata2pc.obj = pc)
##D samp5 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.99, fdata2pc.obj = pc)
##D cols <- rainbow(5, alpha = 0.25)
##D par(mfrow = c(3, 2))
##D plot(X.fdata, col = gray(0.75), lty = 1, main = "Data")
##D plot(samp1, col = cols[1], lty = 1, main = "Threshold = 0.25")
##D plot(samp2, col = cols[2], lty = 1, main = "Threshold = 0.50")
##D plot(samp3, col = cols[3], lty = 1, main = "Threshold = 0.90")
##D plot(samp4, col = cols[4], lty = 1, main = "Threshold = 0.95")
##D plot(samp5, col = cols[5], lty = 1, main = "Threshold = 0.99")
##D 
##D # Normalizing
##D samp1 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.50, fdata2pc.obj = pc,
##D                  norm = TRUE)
##D samp2 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.90, fdata2pc.obj = pc,
##D                  norm = TRUE)
##D samp3 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.95, fdata2pc.obj = pc,
##D                  norm = TRUE)
##D samp4 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.99, fdata2pc.obj = pc,
##D                  norm = TRUE)
##D samp5 <- rdir.pc(n = 100, X.fdata = X.fdata, ncomp = 0.999, fdata2pc.obj = pc,
##D                  norm = TRUE)
##D cols <- rainbow(5, alpha = 0.25)
##D par(mfrow = c(3, 2))
##D plot(X.fdata, col = gray(0.75), lty = 1, main = "Data")
##D plot(samp1, col = cols[1], lty = 1, main = "Threshold = 0.50")
##D plot(samp2, col = cols[2], lty = 1, main = "Threshold = 0.90")
##D plot(samp3, col = cols[3], lty = 1, main = "Threshold = 0.95")
##D plot(samp4, col = cols[4], lty = 1, main = "Threshold = 0.99")
##D plot(samp5, col = cols[5], lty = 1, main = "Threshold = 0.999")
## End(Not run)



