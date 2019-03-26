library(monoreg)


### Name: monoreg
### Title: Bayesian monotonic regression
### Aliases: monoreg

### ** Examples

library(monoreg)
set.seed(1)
# nobs <- 1000
nobs <- 50
sigma <- 0.01
x1 <- runif(nobs)
x2 <- runif(nobs)

# 6 different monotonic regression surfaces:
# mu <- sqrt(x1)
mu <- 0.5 * x1 + 0.5 * x2
# mu <- pmin(x1, x2)
# mu <- 0.25 * x1 + 0.25 * x2 + 0.5 * (x1 + x2 > 1.0)
# mu <- 0.25 * x1 + 0.25 * x2 + 0.5 * (pmax(x1, x2) > 0.5)
# mu <- ifelse((x1 - 1.0)^2 + (x2 - 1.0)^2 < 1.0, sqrt(1.0 - (x1 - 1.0)^2 - (x2 - 1.0)^2), 0.0)

y <- rnorm(nobs, mu, sigma)

# results <- monoreg(niter=15000, burnin=5000, adapt=5000, refresh=10, 
results <- monoreg(niter=5000, burnin=2500, adapt=2500, refresh=10, 
                   thin=5, birthdeath=10, seed=1, rhoa=0.1, rhob=0.1, 
                   deltai=0.1, drange=2.0, predict=rep(1.0, nobs), 
                   include=rep(1.0, nobs), response=y, offset=NULL, 
                   axes=cbind(x1,x2), covariates=rep(1.0, nobs), 
                   settozero=getcmat(2), package=rep(1,3)) 

# pdf(file.path(getwd(), 'pred3d.pdf'), width=6.0, height=6.0, paper='special')
op <- par(mar=c(2,2,0,0), oma=c(0,0,0,0), mgp=c(2.5,1,0), cex=0.75)
pred <- colMeans(results$pred)
idx <- order(pred, decreasing=TRUE)

tr <- persp(z=matrix(c(NA,NA,NA,NA), 2, 2), zlim=c(0,1), 
            xlim=c(0,1), ylim=c(0,1),
            ticktype='detailed', theta=-45, phi=25, ltheta=25, 
            xlab='X1', ylab='X2', zlab='mu')
for (i in 1:nobs) {
    lines(c(trans3d(x1[idx[i]], x2[idx[i]], 0.0, tr)$x, 
            trans3d(x1[idx[i]], x2[idx[i]], pred[idx[i]], tr)$x),
          c(trans3d(x1[idx[i]], x2[idx[i]], 0.0, tr)$y, 
            trans3d(x1[idx[i]], x2[idx[i]], pred[idx[i]], tr)$y),
          col='gray70')
}
points(trans3d(x1[idx], x2[idx], pred[idx], tr), pch=21, bg='white')
par(op)
# dev.off()



