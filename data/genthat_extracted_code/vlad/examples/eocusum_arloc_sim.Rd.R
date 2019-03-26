library(vlad)


### Name: eocusum_arloc_sim
### Title: Compute Out of Control ARLs of EO-CUSUM control charts using
###   simulation
### Aliases: eocusum_arloc_sim

### ** Examples

## Not run: 
##D library("vlad")
##D library("spcadjust")
##D ## Datasets
##D data("cardiacsurgery")
##D s5000 <- dplyr::sample_n(cardiacsurgery, size=5000, replace=TRUE)
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D df2 <- subset(s5000, select=c(Parsonnet, status))
##D ## estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
##D coeff2 <- round(coef(glm(status~Parsonnet, data=df2, family="binomial")), 3)
##D 
##D ## Serial simulation
##D ## set seed for reproducibility
##D RNGkind("L'Ecuyer-CMRG")
##D m <- 10^3
##D RLS <- do.call(c, lapply(1:m, eocusum_arloc_sim, h=4.498, k=0, df=df1, side="low", coeff=coeff1,
##D                          coeff2=coeff2))
##D data.frame(cbind("ARL"=mean(RLS), "ARLSE"=sd(RLS)/sqrt(m)))
##D ## ARL=366.697; ARLSE=9.457748
##D ## Parallel simulation (FORK)
##D ## set seed for reproducibility
##D RNGkind("L'Ecuyer-CMRG")
##D RLS <- simplify2array(parallel::mclapply(1:m, eocusum_arloc_sim, h=4.498, k=0, df=df1, side="low",
##D                                          coeff=coeff1, coeff2=coeff2,
##D                                          mc.cores=parallel::detectCores()))
##D data.frame(cbind("ARL"=mean(RLS), "ARLSE"=sd(RLS)/sqrt(m)))
##D 
##D ## Parallel simulation (PSOCK)
##D ## set seed for reproducibility
##D RNGkind("L'Ecuyer-CMRG")
##D no_cores <- parallel::detectCores()
##D cl <- parallel::makeCluster(no_cores)
##D side <- 1
##D h_vec <- 4.498
##D QS_vec <- 1
##D m <- 10^3
##D k <- 0
##D parallel::clusterExport(cl, c("h_vec", "eocusum_arloc_sim", "df1", "coeff1", "coeff2",
##D                               "QS_vec", "side", "k"))
##D time <- system.time( {
##D RLS <- array(NA, dim=c( length(QS_vec), length(h_vec), m))
##D for (h in h_vec) {
##D   for (QS in QS_vec) {
##D     cat(h, " ", QS, "\n")
##D     RLS[which(QS_vec==QS), which(h==h_vec), ] <- parallel::parSapply(cl, 1:m, eocusum_arloc_sim,
##D                                                                      side=side, QS=QS, h=h, k=k,
##D                                                                      df=df1,  coeff=coeff1,
##D                                                                      coeff2=coeff2,
##D                                                                       USE.NAMES=FALSE)
##D     }
##D   }
##D } )
##D ARL <- apply(RLS, c(1, 2), mean)
##D ARLSE <- sqrt(apply(RLS, c(1, 2), var)/m)
##D print(list(ARL, ARLSE, time))
##D parallel::stopCluster(cl)
## End(Not run)



