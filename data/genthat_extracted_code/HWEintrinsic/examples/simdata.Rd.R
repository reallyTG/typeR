library(HWEintrinsic)


### Name: simdata
### Title: Two Alleles Simulated Data
### Aliases: simdata dataset1 dataset2 dataset3 dataset4
### Keywords: datasets HWE

### ** Examples

data(simdata)
summary(dataset1)
plot(dataset1)
summary(dataset2)
plot(dataset2)
summary(dataset3)
plot(dataset3)
summary(dataset4)
plot(dataset4)

# The following code reproduces Figure 4 in Consonni et al. (2011) #
## Not run: 
##D # ATTENTION: it may take a long time to run! #
##D 
##D n <- sum(dataset1@data.vec, na.rm = TRUE)
##D f <- c(.1,.5,1)
##D t <- round(f*n)
##D p11 <- p21 <- seq(0,1,length.out=100)
##D ip <- array(NA,c(length(f),length(p11),length(p21)))
##D for (k in 1:length(f)) {
##D 	ip[k,,] <- outer(X = p11, Y = p21, FUN = Vectorize(ip.tmp), t[k])
##D 	print(paste(k," / ",length(f),sep=""), quote = FALSE)
##D }
##D 
##D r <- 2
##D R <- r*(r + 1)/2
##D l <- 4
##D tables <- matrix(NA, nrow = R, ncol = l)
##D tables[, 1] <- dataset1@data.vec
##D tables[, 2] <- dataset2@data.vec
##D tables[, 3] <- dataset3@data.vec
##D tables[, 4] <- dataset4@data.vec
##D lik <- array(NA, c(l, length(p11), length(p21)))
##D M <- 300000
##D par(mfrow = c(4, 4))
##D for (k in 1:l) {
##D 	y <- new("HWEdata", data = tables[, k])
##D 	lik[k,,] <- lik.multin(y, p11, p21)
##D 	
##D 	nlev <- 10
##D 	for (q in 1:length(f)) {
##D 		contour(p11, p21, ip[q,,], xlab = expression(p[11]),
##D 				ylab = expression(p[21]), nlevels = nlev, col = gray(0),
##D 				main = "", cex.axis = 1.75, cex.lab = 1.75, labcex = 1.4)
##D 		lines(p11^2, 2*p11*(1 - p11), lty = "longdash", col = gray(0), lwd = 2)
##D 		contour(p11, p21, lik[k,,], nlevels = nlev, add = TRUE,
##D 				col = gray(.7), labcex = 1.2)
##D 		abline(a = 1, b = -1, lty = 3, col = gray(.8))
##D 	}
##D 	hwe.ibf.plot(y = y, t.vec = seq(1,n,1), M = M)
##D }
## End(Not run)



