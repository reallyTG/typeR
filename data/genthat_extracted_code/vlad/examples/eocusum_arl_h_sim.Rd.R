library(vlad)


### Name: eocusum_arl_h_sim
### Title: Compute alarm threshold of EO-CUSUM control charts using
###   simulation
### Aliases: eocusum_arl_h_sim

### ** Examples

## Not run: 
##D library("vlad")
##D library("spcadjust")
##D set.seed(1234)
##D data("cardiacsurgery")
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D ## estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status~Parsonnet, data=df1, family="binomial")), 3)
##D ## Number of simulation runs
##D m <- 10^3
##D ## Number of cores
##D nc <- parallel::detectCores()
##D ## Detect deterioration
##D QA <- 2
##D kopt <- optimal_k(QA=QA, parsonnetscores=df1$Parsonnet, coeff=coeff1)
##D h <- eocusum_arl_h_sim(L0=370, df=df1, k=kopt, m=m, coeff=coeff1, side="low", nc=nc)
##D ## V-Mask parameters
##D d <- h/kopt
##D theta <- atan(kopt)*180/pi
##D cbind(kopt, h, theta, d)
## End(Not run)



