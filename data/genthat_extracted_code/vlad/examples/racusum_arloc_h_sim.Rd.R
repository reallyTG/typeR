library(vlad)


### Name: racusum_arloc_h_sim
### Title: Compute alarm threshold (Out of Control ARL) of RA-CUSUM control
###   charts using simulation
### Aliases: racusum_arloc_h_sim

### ** Examples

## Not run: 
##D require("vlad")
##D # Set seed for reproducibility
##D RNGkind("L'Ecuyer-CMRG")
##D set.seed(1234)
##D parallel::mc.reset.stream()
##D # Datasets
##D data("cardiacsurgery")
##D s5000 <- dplyr::sample_n(cardiacsurgery, size=5000, replace=TRUE)
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D df2 <- subset(s5000, select=c(Parsonnet, status))
##D 
##D # Estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
##D coeff2 <- round(coef(glm(status~Parsonnet, data=df2, family="binomial")), 3)
##D 
##D # Number of simulation runs
##D m <- 10^3
##D 
##D # Deterioration:
##D # 1. Determine critical value for given ARL
##D racusum_arloc_h_sim(L0=370, df=df1, coeff=coeff1, coeff2=coeff2, m=m, RA=2, nc=6)
##D # h=2.030933
##D 
##D # 2. Determine ARL and Standard Error
##D RLS <- do.call(c, parallel::mclapply(1:m, racusum_arloc_sim, h=2.035, df=df1, RA=2, coeff=coeff1,
##D                                      coeff2=coeff2, mc.cores=6))
##D data.frame(cbind("ARL"=mean(RLS), "ARLSE"=sd(RLS)/sqrt(m)))
##D # ARL=371.125; ARLSE=11.36053
##D 
##D # Improvement:
##D # 1. Determine critical value for given ARL
##D racusum_arloc_h_sim(L0=370, df=df1, coeff=coeff1, coeff2=coeff2, m=m, RA=1/2, nc=6)
##D # h=1.710999
##D #
##D # 2. Determine ARL and Standard Error
##D RLS <- do.call(c, parallel::mclapply(1:m, racusum_arloc_sim, h=1.760, df=df1, RA=1/2, coeff=coeff1,
##D                                      coeff2=coeff2, mc.cores=6))
##D data.frame(cbind("ARL"=mean(RLS), "ARLSE"=sd(RLS)/sqrt(m)))
##D # ARL=399.613; ARLSE=10.7601
## End(Not run)



