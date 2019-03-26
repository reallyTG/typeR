library(vlad)


### Name: eocusum_adoc_sim
### Title: Compute steady-state ARLs of EO-CUSUM control charts using
###   simulation
### Aliases: eocusum_adoc_sim

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
##D ## Number of simulation runs
##D m <- 10^3
##D ## Number of cores
##D nc <- parallel::detectCores()
##D # steady state
##D RNGkind("L'Ecuyer-CMRG")
##D m <- 10^3
##D tau <- 50
##D kopt <- optimal_k(QA=2, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D # eocusum_arloc_h_sim(L0=370, df=df1, k=kopt, m=m, side="low", coeff=coeff1, coeff2=coeff2, nc=nc)
##D res <- sapply(0:(tau-1), function(i){
##D   RLS <- do.call(c, parallel::mclapply( 1:m, eocusum_adoc_sim, k=kopt, QS=2, h= 2.637854, df=df1,
##D                                         m=i, coeff=coeff1, coeff2=coeff2, side="low", mc.cores=nc))
##D   list(data.frame(cbind(ARL=mean(RLS), ARLSE=sd(RLS)/sqrt(m))))
##D } )
##D RES <- data.frame(cbind(M=0:(tau-1), do.call(rbind, res)))
##D ggplot2::qplot(x=M, y=ARL, data=RES, geom=c("line", "point")) +
##D ggplot2::theme_classic()
## End(Not run)



