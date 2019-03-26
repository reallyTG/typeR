library(lmomco)


### Name: Lcomoment.Wk
### Title: Weighting Coefficient for Sample L-comoment
### Aliases: Lcomoment.Wk
### Keywords: multivariate L-comoment

### ** Examples

Wk <- Lcomoment.Wk(2,3,5)
print(Wk)

## Not run: 
##D # To compute the weight factors for L-skew and L-coskew (k=3) computation
##D # for a sample of size 20.
##D Wk <- matrix(nrow=20,ncol=1)
##D for(r in seq(1,20)) Wk[r] <- Lcomoment.Wk(3,r,20)
##D plot(seq(1,20),Wk, type="b")
## End(Not run)

# The following shows the actual weights used for computation of
# the first four L-moments. The sum of the each sample times the
# corresponding weight equals the L-moment.
fakedat <- sort(c(-10, 20, 30, 40));  n <- length(fakedat)
Wk1 <- Wk2 <- Wk3 <- Wk4 <- vector(mode="numeric", length=n);
for(i in 1:n) {
   Wk1[i] <- Lcomoment.Wk(1,i,n)/n
   Wk2[i] <- Lcomoment.Wk(2,i,n)/n
   Wk3[i] <- Lcomoment.Wk(3,i,n)/n
   Wk4[i] <- Lcomoment.Wk(4,i,n)/n
}
cat(c("Weights for mean",         round(Wk1, digits=4), "\n"))
cat(c("Weights for L-scale",      round(Wk2, digits=4), "\n"))
cat(c("Weights for 3rd L-moment", round(Wk3, digits=4), "\n"))
cat(c("Weights for 4th L-moment", round(Wk4, digits=4), "\n"))
my.lams <- c(sum(fakedat*Wk1), sum(fakedat*Wk2),
             sum(fakedat*Wk3), sum(fakedat*Wk4))
cat(c("Manual L-moments:", my.lams, "\n"))
cat(c("lmomco L-moments:", lmoms(fakedat, nmom=4)$lambdas,"\n"))
# The last two lines of output should be the same---note that lmoms()
# does not utilize Lcomoment.Wk(). So a double check is made.



