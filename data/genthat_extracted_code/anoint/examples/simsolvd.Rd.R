library(anoint)


### Name: simsolvd
### Title: Simulated SOLVD-Trial data set
### Aliases: simsolvd
### Keywords: datasets

### ** Examples


data(simsolvd)

obj <- anoint(Surv(ttodthorchfhosp,censor==0)~(age+beat+lvef)*trt,
				data = simsolvd, family = "coxph")

uim(obj)$fit




