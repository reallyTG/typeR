library(gMCP)


### Name: calcPower
### Title: Calculate power values
### Aliases: calcPower
### Keywords: htest

### ** Examples


## reproduce example from Stat Med paper (Bretz et al. 2010, Table I)
## first only consider line 2 of Table I
## significance levels
graph <- simpleSuccessiveII()
## alternative (mvn distribution)
corMat <- rbind(c(1, 0.5, 0.5, 0.5/2),
                c(0.5,1,0.5/2,0.5),
                c(0.5,0.5/2,1,0.5),
                c(0.5/2,0.5,0.5,1))
theta <- c(3, 0, 0, 0)
calcPower(graph=graph, alpha=0.025, mean=theta, corr.sim=corMat, n.sim= 100000)


## now reproduce all 14 simulation scenarios
## different graphs
weights1 <- c(rep(1/2, 12), 1, 1)
weights2 <- c(rep(1/2, 12), 0, 0)
eps <- 0.01
gam1 <- c(rep(0.5, 10), 1-eps, 0, 0, 0)
gam2 <- gam1
## different multivariate normal alternatives
rho <- c(rep(0.5, 8), 0, 0.99, rep(0.5,4))
th1 <- c(0, 3, 3, 3, 2, 1, rep(3, 7), 0)
th2 <- c(rep(0, 6), 3, 3, 3, 3, 0, 0, 0, 3)
th3 <- c(0, 0, 3, 3, 3, 3, 0, 2, 2, 2, 3, 3, 3, 3)
th4 <- c(0,0,0,3,3,3,0,2,2,2,0,0,0,0)

## function that calculates power values for one scenario
simfunc <- function(nSim, a1, a2, g1, g2, rh, t1, t2, t3, t4, Gr){
  al <- c(a1, a2, 0, 0)
  G <- rbind(c(0, g1, 1-g1, 0), c(g2, 0, 0, 1-g2), c(0, 1, 0, 0), c(1, 0, 0, 0))
  corMat <- rbind(c(1, 0.5, rh, rh/2), c(0.5,1,rh/2,rh), c(rh,rh/2,1,0.5), c(rh/2,rh,0.5,1))
  mean <- c(t1, t2, t3, t4)
  calcPower(weights=al, alpha=0.025, G=G, mean=mean, corr.sim=corMat, n.sim = nSim)
}

## calculate power for all 14 scenarios
outList <- list()
for(i in 1:14){
  outList[[i]] <- simfunc(10000, weights1[i], weights2[i], 
                    gam1[i], gam2[i], rho[i], th1[i], th2[i], th3[i], th4[i])
}

## summarize data as in Stat Med paper Table I 
atlst1 <- as.numeric(lapply(outList, function(x) x$PowAtlst1))
locpow <- do.call("rbind", lapply(outList, function(x) x$LocalPower))

round(cbind(atlst1, locpow), 5)




