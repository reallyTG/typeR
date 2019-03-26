library(hetGP)


### Name: ato
### Title: Assemble To Order (ATO) Data and Fits
### Aliases: ato X Z Xa Xtrain Xtrain.out Ztrain Ztrain.out train mult reps
###   kill Zm Zv out Xtest Ztest nc ato.a Xa Za out.a
### Keywords: datasets datagen

### ** Examples

data(ato)

## Not run: 
##D ##
##D ## the code below was used to create the random partition 
##D ##
##D 
##D ## recover the data in its original form
##D X <- X*19+1
##D Z <- Z*sqrt(Zv) + Zm
##D 
##D ## code the inputs and outputs; i.e., undo the transformation 
##D ## above
##D X <- (X-1)/19
##D Zm <- mean(Z)
##D Zv <- var(as.vector(Z))
##D Z <- (Z - Zm)/sqrt(Zv)
##D 
##D ## random training and testing partition
##D train <- sample(1:nrow(X), 1000)
##D Xtrain <- X[train,]
##D Xtest <- X[-train,]
##D Ztest <- as.list(as.data.frame(t(Z[-train,])))
##D Ztrain <- Ztrain.out <- list()
##D mult <- rep(NA, nrow(Xtrain))
##D kill <- rep(FALSE, nrow(Xtrain))
##D for(i in 1:length(train)) {
##D   reps <- sample(1:ncol(Z), 1)
##D   w <- sample(1:ncol(Z), reps)
##D   Ztrain[[i]] <- Z[train[i],w]
##D   if(reps < 10) Ztrain.out[[i]] <- Z[train[i],-w]
##D   else kill[i] <- TRUE
##D   mult[i] <- reps
##D }
##D 
##D ## calculate training locations and outputs for replicates not
##D ## included in Ztrain
##D Xtrain.out <- Xtrain[!kill,]
##D Ztrain.out <- Ztrain[which(!kill)]
##D 
##D ## fit hetGP model
##D out <- mleHetGP(X=list(X0=Xtrain, Z0=sapply(Ztrain, mean), mult=mult),
##D   Z=unlist(Ztrain), lower=rep(0.01, ncol(X)), upper=rep(30, ncol(X)),
##D   covtype="Matern5_2", noiseControl=nc, known=list(beta0=0), 
##D   maxit=100000, settings=list(return.matrices=FALSE))
##D 
##D ##
##D ## the adaptive lookahead design is read in and fit as 
##D ## follows
##D ##
##D Xa <- (ato.a[,1:8]-1)/19
##D Za <- ato.a[,9]
##D Za <- (Za - Zm)/sqrt(Zv)
##D 
##D ## uses nc defined above
##D out.a <- mleHetGP(Xa, Za, lower=rep(0.01, ncol(X)), 
##D   upper=rep(30, ncol(X)), covtype="Matern5_2", known=list(beta0=0), 
##D   noiseControl=nc, maxit=100000, settings=list(return.matrices=FALSE))
## End(Not run)

##
## the following code duplicates a predictive comparison in
## the package vignette
##

## first using the model fit to the train partition (out)
out <- rebuild(out)

## predicting out-of-sample at the test sights
phet <- predict(out, Xtest)
phets2 <- phet$sd2 + phet$nugs
mhet <- as.numeric(t(matrix(rep(phet$mean, 10), ncol=10)))
s2het <- as.numeric(t(matrix(rep(phets2, 10), ncol=10)))
sehet <- (unlist(t(Ztest)) - mhet)^2
sc <- - sehet/s2het - log(s2het)
mean(sc)

## predicting at the held-out training replicates
phet.out <- predict(out, Xtrain.out)
phets2.out <- phet.out$sd2 + phet.out$nugs
s2het.out <- mhet.out <- Ztrain.out
for(i in 1:length(mhet.out)) {
  mhet.out[[i]] <- rep(phet.out$mean[i], length(mhet.out[[i]]))
  s2het.out[[i]] <- rep(phets2.out[i], length(s2het.out[[i]]))
}
mhet.out <- unlist(t(mhet.out))
s2het.out <- unlist(t(s2het.out))
sehet.out <- (unlist(t(Ztrain.out)) - mhet.out)^2
sc.out <- - sehet.out/s2het.out - log(s2het.out)
mean(sc.out)

## then using the model trained from the "adaptive" 
## sequential design, with comparison from the "batch" 
## one above
out.a <- rebuild(out.a)
phet.a <- predict(out.a, Xtest)
phets2.a <- phet.a$sd2 + phet.a$nugs
mhet.a <- as.numeric(t(matrix(rep(phet.a$mean, 10), ncol=10)))
s2het.a <- as.numeric(t(matrix(rep(phets2.a, 10), ncol=10)))
sehet.a <- (unlist(t(Ztest)) - mhet.a)^2
sc.a <- - sehet.a/s2het.a - log(s2het.a)
c(batch=mean(sc), adaptive=mean(sc.a))

## an example of one iteration of sequential design
## Not run: 
##D   Wijs <- hetGP:::Wij(out.a$X0, theta=out.a$theta, type=out.a$covtype)
##D   h <- horizon(out.a, Wijs=Wijs)
##D   control = list(tol_dist=1e-4, tol_diff=1e-4, multi.start=30, maxit=100)
##D   opt <- IMSPE_optim(out.a, h, Wijs=Wijs, control=control)
##D   opt$par
## End(Not run)



