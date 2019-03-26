library(covBM)


### Name: lmeBM
### Title: lmeBM
### Aliases: lmeBM

### ** Examples

BMmodel<-lmeBM(sqrtcd4~t, data=cd4, random=~t|newpid, covariance=covBM(form=~t|newpid),
							method="ML", control=list(opt="link{nlm}"))



