library(genSurv)


### Name: as.THMM
### Title: Coerce to an object of class 'THMM'
### Aliases: as.THMM is.THMM
### Keywords: manip methods survival

### ** Examples

# generate CMM data
cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )

# coerce CMM data to THMM data
thmmdata0 <- as.THMM(cmmdata)
head(thmmdata0, n=20L)

# generate TDCM data
tdcmdata <- genTDCM(n=100, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=10)

# coerce TDCM data to THMM data
thmmdata1 <- as.THMM(tdcmdata)
head(thmmdata1, n=20L)



