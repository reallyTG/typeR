library(DiceOptim)


### Name: qEI.grad
### Title: Gradient of the multipoint expected improvement (qEI) criterion
### Aliases: qEI.grad
### Keywords: models optimize

### ** Examples

## Not run: 
##D set.seed(15)
##D # Example 1 - validation by comparison to finite difference approximations
##D 
##D # a 10-points optimum LHS design and the corresponding responses
##D d <- 2;n <- d*5
##D design <- maximinESE_LHS(lhsDesign(n,d)$design,1)$design
##D colnames(design)<-c("x1", "x2")
##D lower <- c(0,0)
##D upper <- c(1,1)
##D y <- data.frame(apply(design, 1, branin))
##D names(y) <- "y"
##D 
##D # learning
##D model <- km(~1, design=design, response=y)
##D 
##D # pick up 4 points sampled from the simple expected improvement
##D q <- 4
##D X <- sampleFromEI(model,n=q)
##D 
##D # compute the gradient at the 4-point batch
##D grad.analytic <- qEI.grad(X,model)
##D # numerically compute the gradient
##D grad.numeric <- matrix(NaN,q,d)
##D eps <- 10^(-6)
##D EPS <- matrix(0,q,d)
##D for (i in 1:q) {
##D   for (j in 1:d) {
##D     EPS[i,j] <- eps
##D     grad.numeric[i,j] <- 1/eps*(qEI(X+EPS,model,fastCompute=FALSE)-qEI(X,model,fastCompute=FALSE))
##D     EPS[i,j] <- 0
##D   }
##D }
##D print(grad.numeric)
##D print(grad.analytic)
##D 
##D # graphics: displays the EI criterion, the design points in black,
##D # the batch points in red and the gradient in blue.
##D nGrid <- 15
##D gridAxe1 <- seq(lower[1],upper[1],length=nGrid)
##D gridAxe2 <- seq(lower[2],upper[2],length=nGrid)
##D grid <- expand.grid(gridAxe1,gridAxe2)
##D aa <- apply(grid,1,EI,model=model)
##D myMat <- matrix(aa,nrow=nGrid)
##D image(x = gridAxe1, y = gridAxe2, z = myMat,
##D       col = colorRampPalette(c("darkgray","white"))(5*10),
##D       ylab = names(design)[1], xlab=names(design)[2],
##D       main = "qEI-gradient of a batch of 4 points", axes = TRUE,
##D       zlim = c(min(myMat), max(myMat)))
##D contour(x = gridAxe1, y = gridAxe2, z = myMat,
##D         add = TRUE, nlevels = 10)
##D points(X[,1],X[,2],pch=19,col='red')
##D points(model@X[,1],model@X[,2],pch=19)
##D arrows(X[,1],X[,2],X[,1]+0.012*grad.analytic[,1],X[,2]+0.012*grad.analytic[,2],col='blue')
## End(Not run)



