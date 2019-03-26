library(VCA)


### Name: test.lsmeans
### Title: Perform t-Tests for Linear Contrasts on LS Means.
### Aliases: test.lsmeans

### ** Examples

## Not run: 
##D data(dataEP05A2_2)
##D ub.dat <- dataEP05A2_2[-c(11,12,23,32,40,41,42),]
##D fit1 <- anovaMM(y~day/(run), ub.dat)
##D fit2 <- remlMM(y~day/(run), ub.dat)
##D lsm1 <- lsmeans(fit1)
##D lsm2 <- lsmeans(fit2)
##D lsm1
##D lsm2
##D 
##D lc.mat <- getL(fit1, c("day1-day2", "day3-day6"), "lsm")
##D lc.mat[1,c(1,2)] <- c(1,-1)
##D lc.mat[2,c(3,6)] <- c(1,-1)
##D lc.mat
##D test.lsmeans(fit1, lc.mat) 
##D test.lsmeans(fit2, lc.mat)
##D 
##D # fit mixed model from the 'nlme' package
##D  
##D library(nlme)
##D data(Orthodont)
##D fit.lme <- lme(distance~Sex*I(age-11), random=~I(age-11)|Subject, Orthodont) 
##D 
##D # re-organize data for using 'anovaMM'
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D 
##D # model without intercept
##D fit.anovaMM <- anovaMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
##D fit.remlMM1 <- remlMM( distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
##D fit.remlMM2 <- remlMM( distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho, cov=FALSE)
##D lsm0 <- lsmeans(fit.anovaMM)
##D lsm1 <- lsmeans(fit.remlMM1)
##D lsm2 <- lsmeans(fit.remlMM2)
##D lsm0
##D lsm1
##D lsm2
##D 
##D lc.mat <- matrix(c(1,-1), nrow=1, dimnames=list("int.Male-int.Female", c("SexMale", "SexFemale")))
##D lc.mat
##D test.lsmeans(fit.anovaMM, lc.mat)	
##D test.lsmeans(fit.remlMM1, lc.mat)
##D test.lsmeans(fit.remlMM2, lc.mat)
## End(Not run)	



