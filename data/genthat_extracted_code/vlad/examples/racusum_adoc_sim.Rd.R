library(vlad)


### Name: racusum_adoc_sim
### Title: Compute steady-state ARLs of RA-CUSUM control charts using
###   simulation
### Aliases: racusum_adoc_sim

### ** Examples

## Not run: 
##D library("vlad")
##D library("spcadjust")
##D data("cardiacsurgery")
##D # build data set
##D df1 <- subset(cardiacsurgery, select=c(Parsonnet, status))
##D 
##D # estimate coefficients from logit model
##D coeff1 <- round(coef(glm(status ~ Parsonnet, data=df1, family="binomial")), 3)
##D 
##D # simulation of conditional steady state
##D m <- 10^3
##D tau <- 50
##D res <- sapply(0:(tau-1), function(i){
##D  RLS <- do.call(c, parallel::mclapply( 1:m, racusum_adoc_sim, RQ=2, h=2.0353, df=df1, m=i,
##D                                        coeff=coeff1, coeff2=coeff1,
##D                                        mc.cores=parallel::detectCores()) )
##D  list(data.frame(cbind(ARL=mean(RLS), ARLSE=sd(RLS)/sqrt(m))))
##D } )
##D 
##D # plot
##D RES <- data.frame(cbind(M=0:(tau-1), do.call(rbind, res)))
##D ggplot2::qplot(x=M, y=ARL, data=RES, geom=c("line", "point")) +
##D ggplot2::theme_classic()
## End(Not run)



