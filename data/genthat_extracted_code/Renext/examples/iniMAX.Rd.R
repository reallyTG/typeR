library(Renext)


### Name: parIni.MAX
### Title: Initial estimation of GPD parameters for an aggregated renewal
###   model
### Aliases: parIni.MAX parIni.OTS

### ** Examples

set.seed(1234)
## initialisation for 'MAX' data
u <- 10
nBlocks <- 30
nSim <- 100
ParMAX <- matrix(NA, nrow = nSim, ncol = 2)
colnames(ParMAX) <- c("lambda", "sigma")

for (i in 1:nSim) {
  rd <- rRendata(threshold = u,
                 effDuration = 1,
                 lambda = 12,
                 MAX.effDuration = c(60, rexp(nBlocks)),
                 MAX.r = c(5, 2 + rpois(nBlocks, lambda = 1)),
                 distname.y = "exp", par.y = c(rate = 1 / 100))

  MAX <- Renext:::makeMAXdata(rd)
  pari <- parIni.MAX(MAX = MAX, threshold = u)
  ParMAX[i, ] <- pari   
}
## the same for OTS data
u <- 10
nBlocks <- 10
nSim <- 100
ParOTS <- matrix(NA, nrow = nSim, ncol = 2)
colnames(ParOTS) <- c("lambda", "sigma")
rds <- list()

for (i in 1:nSim) {
  rd <- rRendata(threshold = u,
                 effDuration = 1,
                 lambda = 12,
                 OTS.effDuration = rexp(nBlocks, rate = 1 / 10),
                 OTS.threshold = u + rexp(nBlocks, rate = 1 / 10),
                 distname.y = "exp", par.y = c(rate = 1 / 100))
  rds[[i]] <- rd
  OTS <-  Renext:::makeOTSdata(rd)
  pari <- parIni.OTS(OTS = OTS, threshold = u)
  ParOTS[i, ] <- pari   
}




