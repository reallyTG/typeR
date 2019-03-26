library(agridat)


### Name: cornelius.maize
### Title: Multi-environment trial of maize for 9 cultivars at 20
###   locations.
### Aliases: cornelius.maize
### Keywords: datasets

### ** Examples


data(cornelius.maize)
dat <- cornelius.maize
# dotplot(gen~yield|env,dat) # We cannot compare genotype yields easily
# Subtract environment mean from each observation
if(require(reshape2)){
mat <- acast(dat, gen~env)
mat <- scale(mat, scale=FALSE)
dat2 <- melt(mat)
names(dat2) <- c('gen','env','yield')
require(lattice)
bwplot(yield ~ gen, dat2,
       main="cornelius.maize - environment centered yields")
}

## Not run: 
##D # This reproduces the analysis of Forkman and Piepho.
##D 
##D test.pc <- function(Y0, type="AMMI", n.boot=10000, maxpc=6) {
##D 
##D   # Test the significance of Principal Components in GGE/AMMI
##D 
##D   # Singular value decomposition of centered/double-centered Y
##D   Y <- sweep(Y0, 1, rowMeans(Y0)) # subtract environment means
##D   if(type=="AMMI") {
##D     Y <- sweep(Y, 2, colMeans(Y0)) # subtract genotype means
##D     Y <- Y + mean(Y0)
##D   }
##D   lam <- svd(Y)$d
##D 
##D   # Observed value of test statistic.
##D   # t.obs[k] is the proportion of variance explained by the kth term out of
##D   # the k...M terms, e.g. t.obs[2] is lam[2]^2 / sum(lam[2:M]^2)
##D   t.obs <- { lam^2/rev(cumsum(rev(lam^2))) } [1:(M-1)]
##D   t.boot <- matrix(NA, nrow=n.boot, ncol=M-1)
##D 
##D   # Centering rows/columns reduces the rank by 1 in each direction.
##D   I <- if(type=="AMMI") nrow(Y0)-1 else nrow(Y0)
##D   J <- ncol(Y0)-1
##D   M <- min(I, J) # rank of Y, maximum number of components
##D   M <- min(M, maxpc) # Optional step: No more than 5 components
##D 
##D   for(K in 0:(M-2)){ # 'K' multiplicative components in the svd
##D 
##D     for(bb in 1:n.boot){
##D       E.b <- matrix(rnorm((I-K) * (J-K)), nrow = I-K, ncol = J-K)
##D       lam.b <- svd(E.b)$d
##D       t.boot[bb, K+1] <- lam.b[1]^2 / sum(lam.b^2)
##D     }
##D 
##D   }
##D 
##D   # P-value for each additional multiplicative term in the SVD.
##D   # P-value is the proportion of time bootstrap values exceed t.obs
##D   colMeans(t.boot > matrix(rep(t.obs, n.boot), nrow=n.boot, byrow=TRUE))
##D }
##D 
##D dat <- cornelius.maize
##D 
##D # Convert to matrix format
##D require(reshape2)
##D dat <- acast(dat, env~gen, value.var='yield')
##D 
##D ## R> test.pc(dat,"AMMI")
##D ## [1] 0.0000 0.1505 0.2659 0.0456 0.1086 # Forkman: .00 .156 .272 .046 .111
##D 
##D ## R> test.pc(dat,"GGE")
##D ## [1] 0.0000 0.2934 0.1513 0.0461 0.2817 # Forkman: .00 .296 .148 .047 .285
##D 
## End(Not run)



