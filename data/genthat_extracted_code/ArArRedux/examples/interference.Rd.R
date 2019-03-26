library(ArArRedux)


### Name: interference
### Title: define the interference corrections
### Aliases: interference

### ** Examples

samplefile <- system.file("Samples.csv",package="ArArRedux")
irrfile <- system.file("irradiations.csv",package="ArArRedux")
masses <- c("Ar37","Ar38","Ar39","Ar40","Ar36")
X <- read(samplefile,masses,blabel="EXB#",Jpos=c(3,15))
irr <- loadirradiations(irrfile)
# assume log(36Ar/37Ar) = log(39Ar/37Ar) = 1 in co-irradiate Ca-salt
# with variances of 0.0001 and zero covariances
ca <- interference(intercepts=c(1,1),
                   covmat=matrix(c(0.001,0,0,0.001),nrow=2),
                   num=c("Ar39","Ar36"),den=c("Ar37","Ar37"),
                   irr=X$irr[1],label="Ca-salt")
# assume log(39Ar/40Ar) = 4.637788 in co-irradiate K-glass
# with variance 7.9817e-4
k <- interference(intercepts=4.637788,covmat=7.9817e-4,
                  num="Ar39",den="Ar40",irr=X$irr[1],
                  label="K-glass")
ages <- process(X,irr,ca=ca,k=k)
summary(ages)



