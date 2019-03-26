library(vlad)


### Name: eocusum_arl_sim
### Title: Compute ARLs of EO-CUSUM control charts using simulation
### Aliases: eocusum_arl_sim

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
##D RNGkind("L'Ecuyer-CMRG")
##D m <- 10^3
##D kopt <- optimal_k(QA=2, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D #eocusum_arloc_h_sim(L0=370, df=df1, k=kopt, m=m, side="low", coeff=coeff1, coeff2=coeff2, nc=nc)
##D RLS <- do.call(c, lapply(1:m, eocusum_arloc_sim, h=2.626, k=kopt, df=df1, side="low", coeff=coeff1,
##D                          coeff2=coeff2))
##D data.frame(cbind(ARL=mean(RLS), ARLSE=sd(RLS)/sqrt(m)))
##D ## Parallel simulation (FORK)
##D RNGkind("L'Ecuyer-CMRG")
##D m <- 10^3
##D kopt <- optimal_k(QA=2, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D RLS <- simplify2array(parallel::mclapply(1:m, eocusum_arloc_sim, h=2.626, k=kopt, df=df1,
##D                                          side="low", coeff=coeff1, coeff2=coeff2,
##D                                          mc.cores=parallel::detectCores()))
##D data.frame(cbind(ARL=mean(RLS), ARLSE=sd(RLS)/sqrt(m)))
##D 
##D ## Parallel simulation (PSOCK)
##D RNGkind("L'Ecuyer-CMRG")
##D no_cores <- parallel::detectCores()
##D cl <- parallel::makeCluster(no_cores)
##D side <- "low"
##D h_vec <- 2.626
##D QS_vec <- 1
##D m <- 10^3
##D k <- optimal_k(QA=2, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D parallel::clusterExport(cl, c("h_vec", "eocusum_arloc_sim", "df1", "coeff1", "coeff2",
##D                               "QS_vec", "side", "k"))
##D time <- system.time( {
##D   RLS <- array(NA, dim=c( length(QS_vec), length(h_vec), m))
##D   for (h in h_vec) {
##D     for (QS in QS_vec) {
##D       cat(h, " ", QS, "\n")
##D       RLS[which(QS_vec==QS), which(h==h_vec), ] <- parallel::parSapply(cl, 1:m, eocusum_arloc_sim,
##D                                                                        side=side, QS=QS, h=h, k=k,
##D                                                                        df=df1,  coeff=coeff1,
##D                                                                        coeff2=coeff2,
##D                                                                        USE.NAMES=FALSE)
##D     }
##D   }
##D } )
##D ARL <- apply(RLS, c(1, 2), mean)
##D ARLSE <- sqrt(apply(RLS, c(1, 2), var)/m)
##D print(list(ARL, ARLSE, time))
##D parallel::stopCluster(cl)
## End(Not run)



