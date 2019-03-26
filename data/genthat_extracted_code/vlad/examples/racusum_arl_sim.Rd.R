library(vlad)


### Name: racusum_arl_sim
### Title: Compute ARLs of RA-CUSUM control charts using simulation
### Aliases: racusum_arl_sim

### ** Examples

## Not run: 
##D library("vlad")
##D library("spcadjust")
##D set.seed(1234)
##D data("cardiacsurgery")
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D coeff1 <- round(coef(glm(status ~ Parsonnet, data=df1, family="binomial")), 3)
##D 
##D ## Parallel Simulation 1: y = random (10^4 runs, RA=2)
##D m <- 10^4; h_vec <- 2.7; yemp <- FALSE
##D no_cores <- parallel::detectCores()
##D cl <- parallel::makeCluster(no_cores)
##D parallel::clusterExport(cl, c("h_vec", "racusum_arl_sim", "coeff1", "df1", "yemp"))
##D time <- system.time( {
##D   ARL <- array(NA, dim=c( length(h_vec), m))
##D   for (h in h_vec) {
##D     ARL[which(h_vec==h), ] <- parallel::parSapply(cl, 1:m, racusum_arl_sim, h=h, coeff=coeff1,
##D                                                  df=df1, yemp=yemp, USE.NAMES=FALSE) }
##D } )
##D simMean <- apply(ARL, c(1), mean)
##D simSE <- sqrt(apply(ARL, c(1), var)/m)
##D print(list(simMean, simSE, time))
##D parallel::stopCluster(cl)
##D df.sim1 <- data.frame("RA"=2, "h"=h, "ARL"=simMean, "ARLSE"=simSE, "nsim"=m)
##D 
##D ## Parallel Simulation 2: y = empirical (10^4 runs, RA=2)
##D m <- 10^4; h_vec <- 2.7
##D no_cores <- parallel::detectCores()
##D cl <- parallel::makeCluster(no_cores)
##D parallel::clusterExport(cl, c("h_vec", "racusum_arl_sim", "coeff1", "df1"))
##D time <- system.time( {
##D   ARL <- array(NA, dim=c( length(h_vec), m))
##D   for (h in h_vec) {
##D     ARL[which(h_vec==h), ] <- parallel::parSapply(cl, 1:m, racusum_arl_sim, h=h, coeff=coeff1,
##D                                                  df=df1, USE.NAMES=FALSE) }
##D } )
##D simMean <- apply(ARL, c(1), mean)
##D simSE <- sqrt(apply(ARL, c(1), var)/m)
##D print(list(simMean, simSE, time))
##D parallel::stopCluster(cl)
##D df.sim2 <- data.frame("RA"=2, "h"=h, "ARL"=simMean, "ARLSE"=simSE, "nsim"=m)
##D 
##D rbind(df.sim1, df.sim2)
## End(Not run)



