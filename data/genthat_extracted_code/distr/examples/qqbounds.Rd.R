library(distr)


### Name: qqbounds
### Title: Computation of confidence intervals for qqplot
### Aliases: qqbounds
### Keywords: hplot distribution

### ** Examples

qqplot(Norm(15,sqrt(30)), Chisq(df=15))
## uses:
qqbounds(x = rnorm(30),Norm(),alpha=0.95,n=30,
        withConf.pw = TRUE, withConf.sim  = TRUE,
        exact.sCI=TRUE ,exact.pCI= TRUE,
        nosym.pCI = FALSE)
qqbounds(x = rchisq(30,df=4),Chisq(df=4),alpha=0.95,n=30,
        withConf.pw = TRUE, withConf.sim  = TRUE,
        exact.sCI=FALSE ,exact.pCI= FALSE,
        nosym.pCI = FALSE)
qqbounds(x = rchisq(30,df=4),Chisq(df=4),alpha=0.95,n=30,
        withConf.pw = TRUE, withConf.sim  = TRUE,
        exact.sCI=TRUE ,exact.pCI= TRUE,
        nosym.pCI = TRUE)



