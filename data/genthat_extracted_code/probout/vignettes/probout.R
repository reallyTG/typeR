## ---- eval = TRUE, message = FALSE---------------------------------------
 require(GDAdata)

 data(Decathlon)
 
 x <- Decathlon[,c("m100","m400","m1500")]

## ---- fig.height = 7, fig.width = 7--------------------------------------
plot(x[,1], x[,3], xlab = "100 meter timings", ylab = "1500 meter timings", 
     main = "", pch = 16, cex = .5)

## ---- message = FALSE----------------------------------------------------
  require(probout)
  require(FNN)

## ---- eval = TRUE--------------------------------------------------------
lead <- leader(x)

## ---- fig.height = 7, fig.width = 7--------------------------------------
plot(x[,1], x[,3], xlab = "100 meter timings", ylab = "1500 meter timings", 
     main = "leader observations (blue)", pch = 16, cex = .5)
leads <- lead[[1]]$leaders
points(x[leads,1],x[leads,3],pch="+",cex=1.5,col="dodgerblue")

## ---- echo = FALSE, message = FALSE--------------------------------------
  require(mclust)
  require(MASS)

## ---- eval = TRUE--------------------------------------------------------
ntimes <- 100
P <- matrix( NA, length(leads), ntimes)
for (i in 1:ntimes) {
   P[,i] <- partProb( simData(lead[[1]]), method = "distance")
}
pprobs <- apply( P, 1, median)

## ---- fig.height = 7, fig.width = 7--------------------------------------
thresh <- .95
plot(x[,1], x[,3], xlab = "100 meter timings", ylab = "1500 meter timings", 
     main = "leaders: outlier prob > .95 red else blue", pch = 16, cex = .5)
out <- leads[pprobs > thresh]
points(x[leads,1],x[leads,3],pch="+",cex=1.5,col="dodgerblue")
points(x[out,1],x[out,3],pch="*",cex=1.5,col="red")

## ---- eval = TRUE--------------------------------------------------------
probs <- allProb(lead[[1]],pprobs)

## ---- fig.height = 7, fig.width = 7--------------------------------------
plot(x[,1], x[,3], xlab = "100 meter timings", ylab = "1500 meter timings", 
     main = "outlier prob > .95 (red)", pch = 16, cex = .5)
out <- (1:nrow(x))[probs > thresh]
points(x[out,1],x[out,3],pch=1,col="red")

## ---- eval = TRUE--------------------------------------------------------
nsim <-	 (1:15)*1000
nleads <- length(leads)
ntimes <- 100

P <- array( NA, c(nleads, length(nsim), ntimes))
dimnames(P) <- list(NULL, nsim, NULL)

for (i in 1:ntimes) {
   for (j in seq(along = nsim)) {
      P[,j,i] <- partProb( simData(lead[[1]], nsim[j]), method = "distance")
   }
}
probs <- apply( P, c(1,2), median)

## ---- fig.height = 7, fig.width = 7--------------------------------------
plot( nsim, sample(range(probs),size=length(nsim),replace=T), ylim = c(.90,1),
 type="n", xlab = "# simulated observations", ylab = "leader group probability")
dummy <- apply( probs, 1, function(p) lines(nsim,p))
abline( v = 8000, lty = 2)

