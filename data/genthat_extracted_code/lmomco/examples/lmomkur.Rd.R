library(lmomco)


### Name: lmomkur
### Title: L-moments of the Kumaraswamy Distribution
### Aliases: lmomkur
### Keywords: L-moment (distribution) Distribution: Kumaraswamy

### ** Examples

lmr <- lmoms(c(0.25, 0.4, 0.6, 0.65, 0.67, 0.9))
lmomkur(parkur(lmr))
## Not run: 
##D A <- B <- exp(seq(-3,5, by=.05))
##D logA <- logB <- T3 <- T4 <- c();
##D i <- 0
##D for(a in A) {
##D   for(b in B) {
##D     i <- i + 1
##D     parkur <- list(para=c(a,b), type="kur");
##D     lmr <- lmomkur(parkur)
##D     logA[i] <- log(a); logB[i] <- log(b)
##D     T3[i] <- lmr$ratios[3]; T4[i] <- lmr$ratios[4]
##D   }
##D }
##D library(lattice)
##D contourplot(T3~logA+logB, cuts=20, lwd=0.5, label.style="align",
##D             xlab="LOG OF ALPHA", ylab="LOG OF BETA",
##D             xlim=c(-3,5), ylim=c(-3,5),
##D             main="L-SKEW FOR KUMARASWAMY DISTRIBUTION")
##D contourplot(T4~logA+logB, cuts=10, lwd=0.5, label.style="align",
##D             xlab="LOG OF ALPHA", ylab="LOG OF BETA",
##D             xlim=c(-3,5), ylim=c(-3,5),
##D             main="L-KURTOSIS FOR KUMARASWAMY DISTRIBUTION")
## End(Not run)



