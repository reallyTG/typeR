library(genSurv)


### Name: as.TDCM
### Title: Coerce to an object of class 'TDCM'
### Aliases: as.TDCM is.TDCM
### Keywords: manip methods survival

### ** Examples

# generate CMM data
cmmdata <- genCMM( n=1000, model.cens="uniform", cens.par=2.5, beta=c(2,1,-1),
covar=10, rate=c(1,5,1,5,1,5) )

# coerce CMM data to TDCM data
tdcmdata0 <- as.TDCM(cmmdata)
head(tdcmdata0, n=20L)

# generate THMM data
thmmdata <- genTHMM( n=100, model.cens="uniform", cens.par=80, beta= c(0.09,0.08,-0.09),
covar=80, rate= c(0.05,0.04,0.05) )

# coerce THMM data to TDCM data
tdcmdata1 <- as.TDCM(thmmdata)
head(tdcmdata1, n=20L)



