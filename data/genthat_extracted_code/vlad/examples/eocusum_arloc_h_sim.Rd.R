library(vlad)


### Name: eocusum_arloc_h_sim
### Title: Compute alarm threshold of Out of Control EO-CUSUM control
###   charts using simulation
### Aliases: eocusum_arloc_h_sim

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
##D ## Lower cusum (detecting deterioration)
##D ## k = 0
##D eocusum_arloc_h_sim(L0=370, df=df1, k=0, m=m, side="low", coeff=coeff1, coeff2=coeff2, nc=nc)
##D ## k = kopt
##D QA <- 2
##D # use package function optimal_k to determine k
##D kopt <- optimal_k(QA=QA, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D eocusum_arloc_h_sim(L0=370, df=df1, k=kopt, m=m, side="low", coeff=coeff1, coeff2=coeff2, nc=nc)
##D ## Upper cusum (detecting improvement)
##D ## k = 0
##D eocusum_arloc_h_sim(L0=370, df=df1, k=0, m=m, side="up", coeff=coeff1, coeff2=coeff2, nc=nc)
##D ## k = kopt
##D QA <- 1/2
##D kopt <- optimal_k(QA=QA, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D eocusum_arloc_h_sim(L0=370, df=df1, k=kopt, m=m, side="up", coeff=coeff1, coeff2=coeff2, nc=nc)
## End(Not run)



