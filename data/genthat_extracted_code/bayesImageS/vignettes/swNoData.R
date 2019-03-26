## ------------------------------------------------------------------------
beta <- seq(0,2,by=0.1)
tmMx.PU <- tmMx.bIS <- matrix(nrow=length(beta),ncol=2)
rownames(tmMx.PU) <- rownames(tmMx.bIS) <- beta
colnames(tmMx.PU) <- colnames(tmMx.bIS) <- c("user","elapsed")

## ------------------------------------------------------------------------
iter <- 600
burn <- 100
samp.PU <- samp.bIS <- matrix(nrow=length(beta),ncol=iter-burn)

## ------------------------------------------------------------------------
library(bayesImageS)

mask <- matrix(1,50,50)
neigh <- getNeighbors(mask, c(2,2,0,0))
block <- getBlocks(mask, 2)
edges <- getEdges(mask, c(2,2,0,0))

n <- sum(mask)
k <- 2
bcrit <- log(1 + sqrt(k))
maxSS <- nrow(edges)

for (i in 1:length(beta)) {
  if (requireNamespace("PottsUtils", quietly = TRUE)) {
    tm <- system.time(result <- PottsUtils::SW(iter,n,k,edges,beta=beta[i]))
    tmMx.PU[i,"user"] <- tm["user.self"]
    tmMx.PU[i,"elapsed"] <- tm["elapsed"]
    res <- sufficientStat(result, neigh, block, k)
    samp.PU[i,] <- res$sum[(burn+1):iter]
    print(paste("PottsUtils::SW",beta[i],tm["elapsed"],median(samp.PU[i,])))
   } else {
      print("PottsUtils::SW unavailable on this platform.")
   }

  
  # bayesImageS
  tm <- system.time(result <- swNoData(beta[i],k,neigh,block,iter))
  tmMx.bIS[i,"user"] <- tm["user.self"]
  tmMx.bIS[i,"elapsed"] <- tm["elapsed"]
  samp.bIS[i,] <- result$sum[(burn+1):iter]
  print(paste("bayesImageS::swNoData",beta[i],tm["elapsed"],median(samp.bIS[i,])))
}

## ------------------------------------------------------------------------
summary(tmMx.PU)
summary(tmMx.bIS)
boxplot(tmMx.PU[,"elapsed"],tmMx.bIS[,"elapsed"],ylab="seconds elapsed",names=c("SW","swNoData"))

## ------------------------------------------------------------------------
s_z <- c(samp.PU,samp.bIS)
s_x <- rep(beta,times=iter-burn)
s_a <- rep(1:2,each=length(beta)*(iter-burn))
s.frame <- data.frame(s_z,c(s_x,s_x),s_a)
names(s.frame) <- c("stat","beta","alg")
s.frame$alg <- factor(s_a,labels=c("SW","swNoData"))
  if (requireNamespace("lattice", quietly = TRUE)) {
    lattice::xyplot(stat ~ beta | alg, data=s.frame)
  }
plot(c(s_x,s_x),s_z,pch=s_a,xlab=expression(beta),ylab=expression(S(z)))
abline(v=bcrit,col="red")

## ------------------------------------------------------------------------
rowMeans(samp.bIS) - rowMeans(samp.PU)
apply(samp.PU, 1, sd)
apply(samp.bIS, 1, sd)
s.frame$beta <- factor(c(s_x,s_x))
  if (requireNamespace("PottsUtils", quietly = TRUE)) {
    s.fit <- aov(stat ~ alg + beta, data=s.frame)
    summary(s.fit)
    TukeyHSD(s.fit,which="alg")
  }

