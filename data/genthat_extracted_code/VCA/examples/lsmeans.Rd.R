library(VCA)


### Name: lsmeans
### Title: Least Squares Means of Fixed Effects.
### Aliases: lsmeans

### ** Examples

#
## Not run: 
##D data(dataEP05A2_2)
##D fit1 <- anovaMM(y~day/(run), dataEP05A2_2)
##D lsmeans(fit1)
##D lsmeans(fit1,, "complex")
##D 
##D # a more complex model
##D data(VCAdata1)
##D fit2 <- anovaMM(y~(lot+device)/(day)/(run), VCAdata1[VCAdata1$sample==2,])
##D lsmeans(fit2, "lot")
##D lsmeans(fit2, "device", "complex")
##D 
##D # pre-computed 'VarCov' element saves time
##D system.time(lsm1 <- lsmeans(fit2, "device", "complex"))
##D fit2$VarCov <- vcovVC(fit2)
##D system.time(lsm2 <- lsmeans(fit2, "device", "complex"))
##D lsm1
##D lsm2 
##D 
##D # simulate some random data 
##D set.seed(212)
##D id <- rep(1:10,10)
##D x <- rnorm(200)
##D time <- sample(1:5,200,replace=T)
##D y <- rnorm(200)+time
##D snp <- sample(0:1,200,replace=T)
##D dat <- data.frame(id=id,x=x,y=y,time=time,snp=snp)
##D dat$snp <- as.factor(dat$snp)
##D dat$id <- as.factor(dat$id)
##D dat$time <- as.numeric(dat$time)
##D dat$sex <- gl(2, 100, labels=c("Male", "Female"))
##D dat$y <- dat$y + rep(rnorm(2, 5, 1), c(100, 100))
##D 
##D fit3 <- remlMM(y~snp+time+snp:time+sex+(id)+(id):time, dat)
##D 
##D # comute standard LS Means for variable "snp"
##D lsmeans(fit3, var="snp")
##D lsmeans(fit3, var="snp", type="c")    # comprehensive output
##D 
##D # compute LS Means at timepoints 1, 2, 3, 4
##D # Note: original LS Means are always part of the output
##D lsmeans(fit3, var="snp", at=list(time=1:4))
##D 
##D # compute LS Means with different weighting scheme
##D # for factor-variable 'sex'
##D lsmeans(fit3, var="snp", at=list(sex=c(Male=.3, Female=.7)))
##D 
##D # combine covariables at some value and altering the
##D # weighting scheme
##D lsmeans(fit3, var="snp", at=list(time=1:4, sex=c(Male=.3, Female=.7)))
##D 
##D # now with comprehensive output and requesting the
##D # LS Means generating contrast matrix
##D lsmeans(fit3, var="snp", type="complex", contr.mat=TRUE,
##D         at=list(time=1:4, sex=c(Male=.3, Female=.7)))
## End(Not run)



