library(sbmSDP)


### Name: sdp1_admm
### Title: SDP-1 algorithm
### Aliases: sdp1_admm

### ** Examples

# Create a simple blkmodel with K=3 communities each of size m=20
blkmodel <- list(m=20, K=3, p=.9, q=.4)
blkmodel <- within(blkmodel, { 
                   n <- m*K
                   M <- kronecker(matrix(c(p,q,q,q,p,q,q,q,p),nrow=3),matrix(1,m,m))
                   As <- 1*(matrix(runif(n^2),nrow=n) < M)
                   })
# Call sdp1_admm with options:
#  rho  the ADMM parameter, 
#  T    maximum number of iteration
#  tol  tolerance for norm(X_{t+1} - X_t)
#  report_interval  how many iteration between reporting progress
sdp.fit <- with(blkmodel, 
                sdp1_admm(as.matrix(As), K, list(rho=.1, T=10000, tol=1e-5, report_interval=100)))

# plot the adjacency matrix and the estimated cluster matrix
par(mfrow=c(1,2))
image(blkmodel$As)
image(sdp.fit$X)



