library(genSurv)


### Name: as.CMM
### Title: Coerce to an object of class 'CMM'
### Aliases: as.CMM is.CMM
### Keywords: manip methods survival

### ** Examples

# generate TDCM data
tdcmdata <- genTDCM(n=100, dist="exponential", corr=0, dist.par=c(1,1),
model.cens="uniform", cens.par=1, beta=c(-3,2), lambda=10)

# coerce TDCM data to CMM data
cmmdata0 <- as.CMM(tdcmdata)
head(cmmdata0, n=20L)

# generate THMM data
thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )

# coerce THMM data to CMM data
cmmdata1 <- as.CMM(thmmdata)
head(cmmdata1, n=20L)



