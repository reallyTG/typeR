## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----load, warning =FALSE, message=FALSE---------------------------------
library(pivmet)

## ----mus, echo =TRUE, eval = TRUE, message = FALSE, warning = FALSE------
#generate some data

set.seed(123)
n  <- 620
centers  <- 3
n1 <- 20
n2 <- 100
n3 <- 500
x  <- matrix(NA, n,2)
truegroup <- c( rep(1,n1), rep(2, n2), rep(3, n3))

for (i in 1:n1){
 x[i,]=rmvnorm(1, c(1,5), sigma=diag(2))}
for (i in 1:n2){
 x[n1+i,]=rmvnorm(1, c(4,0), sigma=diag(2))}
for (i in 1:n3){
 x[n1+n2+i,]=rmvnorm(1, c(6,6), sigma=diag(2))}

H <- 1000
a <- matrix(NA, H, n)

  for (h in 1:H){
    a[h,] <- kmeans(x,centers)$cluster
  }

#build the similarity matrix
sim_matr <- matrix(1, n,n)
 for (i in 1:(n-1)){
    for (j in (i+1):n){
      sim_matr[i,j] <- sum(a[,i]==a[,j])/H
      sim_matr[j,i] <- sim_matr[i,j]
    }
  }

cl <- KMeans(x, centers)$cluster
mus_alg <- MUS(C = sim_matr, clusters = cl, prec_par = 5)



## ----kmeans, echo =FALSE, fig.show='hold', eval = TRUE, message = FALSE, warning = FALSE----
 kmeans_res <- KMeans(x, centers)

## ----kmeans_plots, echo =FALSE, fig.show='hold', eval = TRUE, message = FALSE, warning = FALSE----

colors_cluster <- c("grey", "darkolivegreen3", "coral")
colors_centers <- c("black", "darkgreen", "firebrick")
 
 plot(x, col = colors_cluster[truegroup]
                 ,bg= colors_cluster[truegroup], pch=21,
                  xlab="y[,1]",
                  ylab="y[,2]", cex.lab=1.5,
                  main="True data", cex.main=1.5)
 
 plot(x, col = colors_cluster[kmeans_res$cluster], 
      bg=colors_cluster[kmeans_res$cluster], pch=21, xlab="y[,1]",
   ylab="y[,2]", cex.lab=1.5,main="K-means",  cex.main=1.5)
 points(kmeans_res$centers, col = colors_centers[1:centers], 
   pch = 8, cex = 2)


## ----musk, fig.show='hold'-----------------------------------------------
piv_res <- piv_KMeans(x, centers)

## ----musk_plots, echo=FALSE, fig.show='hold'-----------------------------
#par(mfrow=c(1,2), pty="s")
colors_cluster <- c("grey", "darkolivegreen3", "coral")
colors_centers <- c("black", "darkgreen", "firebrick")
plot(x, col = colors_cluster[truegroup],
   bg= colors_cluster[truegroup], pch=21, xlab="x[,1]",
   ylab="x[,2]", cex.lab=1.5,
   main="True data", cex.main=1.5)

plot(x, col = colors_cluster[piv_res$cluster],
   bg=colors_cluster[piv_res$cluster], pch=21, xlab="x[,1]",
   ylab="x[,2]", cex.lab=1.5,
   main="piv_Kmeans", cex.main=1.5)
points(x[piv_res$pivots[1],1], x[piv_res$pivots[1],2],
   pch=24, col=colors_centers[1],bg=colors_centers[1],
   cex=1.5)
points(x[piv_res$pivots[2],1], x[piv_res$pivots[2],2],
   pch=24,  col=colors_centers[2], bg=colors_centers[2],
   cex=1.5)
points(x[piv_res$pivots[3],1], x[piv_res$pivots[3],2],
   pch=24, col=colors_centers[3], bg=colors_centers[3],
   cex=1.5)
points(piv_res$centers, col = colors_centers[1:centers],
   pch = 8, cex = 2)


