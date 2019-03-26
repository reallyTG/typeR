library(mlica2)


### Name: mlica
### Title: Maximum likelihood implementation of independent component
###   analysis
### Aliases: mlica

### ** Examples

## Not run: 
##D data(simMAdata);
##D dataX <- simMAdata[[1]];
##D prPCA <- PriorNormPCA(dataX);
##D prNCP <- proposeNCP(prPCA,0.1);
##D a.best.l <- list();
##D for( i in 1:5){
##D  a.best.l[[i]] <- mlica(prNCP,nruns=5);
##D }
##D checkICA <- CheckStability(a.best.l,0.7);
##D sourceS <- simMAdata[[3]];
##D print(cor(a.best.l[[1]]$S,sourceS));
##D sModes <- SortModes(a.best.l[[1]],c.val=0.5);
## End(Not run)

## The function is currently defined as
function (prNCP, nruns = 10, tol = 1e-04, maxit = 300, fail.th = 5, 
    learn.mu = 1) 
{
    print("Entering mlica")
    print("Performing preliminary run")
    a <- mlicaMAIN(prNCP, tol = 1e-04, maxit = 10, mu = learn.mu)
    ncp <- dim(a$S)[2]
    max.logL <- a$LL
    a.best <- a
    print("Finished preliminary run")
    print("Starting runs")
    run.n <- 0
    fail.count <- 0
    v.logL <- vector()
    v.NC <- vector()
    while (run.n < nruns) {
        a <- mlicaMAIN(prNCP, tol = 1e-04, maxit = maxit, mu = learn.mu)
        v.logL <- c(v.logL, a$LL)
        v.NC <- c(v.NC, a$NC)
        if (a$NC == 0) {
            fail.count <- 0
            run.n <- run.n + 1
            if (a$LL > max.logL) {
                a.best <- a
            }
        }
        else {
            fail.count <- fail.count + 1
        }
        if (fail.count >= fail.th) {
            print("Stopping: Five consecutive runs failed to converge!")
            print("Consider either increasing the threshold for pca eigenvalues to perform ICA on a smaller subspace or increasing maxit")
            stop
        }
    }
    print("End of runs")
    return(a.best)
  }



