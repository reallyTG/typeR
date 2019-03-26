library(vlad)


### Name: racusum_arloc_sim
### Title: Compute Out of Control ARLs of RA-CUSUM control charts using
###   simulation
### Aliases: racusum_arloc_sim

### ** Examples

## Not run: 
##D library("vlad"); library("ggplot2")
##D ## Set seed for reproducibility
##D RNGkind("L'Ecuyer-CMRG")
##D ## Datasets
##D data("cardiacsurgery")
##D s5000 <- dplyr::sample_n(cardiacsurgery, size=5000, replace=TRUE)
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D df2 <- subset(s5000, select=c(Parsonnet, status))
##D 
##D ## Estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
##D coeff2 <- round(coef(glm(status~Parsonnet, data=df2, family="binomial")), 3)
##D 
##D ## Number of simulation runs
##D m <- 10^3
##D 
##D ## Deterioration RA=2:
##D ## 1. Determine critical value for given ARL
##D h0 <- racusum_arloc_h_sim(L0=370, df=df1, coeff=coeff1, coeff2=coeff2, m=m, RA=2, nc=6)
##D ## 2. Compute Out of Control ARL
##D RQ <- seq(1, 4, 0.1)
##D rl <- array(NA, dim=c(m, length(RQ)))
##D RLS <- sapply(RQ, function(i) {
##D   cat("RQ: ", i, "\n" )
##D   rl[, i] <- do.call(c, parallel::mclapply(1:m, racusum_arloc_sim, h=h0, df=df1, RA=2, RQ=i,
##D                                            coeff=coeff1, coeff2=coeff2, mc.cores=6))
##D })
##D df3 <- data.frame(cbind(RQ, "ARL"=apply(RLS, 2, mean), "ARLSE"=apply(RLS, 2, mean)/sqrt(m) ))
##D ggplot(df3, aes(RQ, ARL)) + geom_line() + theme_classic()
##D 
##D ## Improvement RA=1/2:
##D ## 1. Determine critical value for given ARL
##D h0 <- racusum_arloc_h_sim(L0=370, df=df1, coeff=coeff1, coeff2=coeff2, m=m, RA=1/2, nc=6)
##D ## 2. Compute Out of Control ARL
##D RQ <- seq(1/4, 1, 1/40)
##D rl <- array(NA, dim=c(m, length(RQ)))
##D RLS <- sapply(RQ, function(i) {
##D   cat("RQ: ", i, "\n" )
##D   rl[, i] <- do.call(c, parallel::mclapply(1:m, racusum_arloc_sim, h=h0, df=df1, RA=1/2, RQ=i,
##D                                            coeff=coeff1, coeff2=coeff2, mc.cores=6))
##D })
##D df4 <- data.frame(cbind(RQ, "ARL"=apply(RLS, 2, mean), "ARLSE"=apply(RLS, 2, mean)/sqrt(m) ))
##D ggplot(df4, aes(RQ, ARL)) + geom_line() + theme_classic()
## End(Not run)



