library(VCA)


### Name: anovaMM
### Title: ANOVA-Type Estimation of Mixed Models.
### Aliases: anovaMM

### ** Examples

## Not run: 
##D 
##D data(dataEP05A2_2)
##D 
##D # assuming 'day' as fixed, 'run' as random
##D anovaMM(y~day/(run), dataEP05A2_2)
##D 
##D # assuming both as random leads to same results as
##D # calling anovaVCA
##D anovaMM(y~(day)/(run), dataEP05A2_2)
##D anovaVCA(y~day/run, dataEP05A2_2)
##D 
##D # use different approaches to estimating the covariance of 
##D # variance components (covariance parameters)
##D dat.ub <- dataEP05A2_2[-c(11,12,23,32,40,41,42),]			# get unbalanced data
##D m1.ub <- anovaMM(y~day/(run), dat.ub, SSQ.method="qf", VarVC.method="scm")
##D m2.ub <- anovaMM(y~day/(run), dat.ub, SSQ.method="qf", VarVC.method="gb")		# is faster
##D V1.ub <- round(vcovVC(m1.ub), 12)
##D V2.ub <- round(vcovVC(m2.ub), 12)
##D all(V1.ub == V2.ub)
##D 
##D # make it explicit that "gb" is faster than "scm"
##D # compute variance-covariance matrix of VCs 10-times
##D 
##D system.time(for(i in 1:500) vcovVC(m1.ub))	# "scm"
##D system.time(for(i in 1:500) vcovVC(m2.ub))	# "gb"
##D 
##D 
##D # fit a larger random model
##D data(VCAdata1)
##D fitMM1 <- anovaMM(y~((lot)+(device))/(day)/(run), VCAdata1[VCAdata1$sample==1,])
##D fitMM1
##D # now use function tailored for random models
##D fitRM1 <- anovaVCA(y~(lot+device)/day/run, VCAdata1[VCAdata1$sample==1,])
##D fitRM1
##D 
##D # there are only 3 lots, take 'lot' as fixed 
##D fitMM2 <- anovaMM(y~(lot+(device))/(day)/(run), VCAdata1[VCAdata1$sample==2,])
##D 
##D # the following model definition is equivalent to the one above,
##D # since a single random term in an interaction makes the interaction
##D # random (see the 3rd reference for details on this topic)
##D fitMM3 <- anovaMM(y~(lot+(device))/day/run, VCAdata1[VCAdata1$sample==2,])
##D 
##D # fit same model for each sample using by-processing
##D lst <- anovaMM(y~(lot+(device))/day/run, VCAdata1, by="sample")
##D lst
##D 
##D # fit mixed model originally from 'nlme' package
##D  
##D library(nlme)
##D data(Orthodont)
##D fit.lme <- lme(distance~Sex*I(age-11), random=~I(age-11)|Subject, Orthodont) 
##D 
##D # re-organize data for using 'anovaMM'
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D fit.anovaMM1 <- anovaMM(distance~Sex*age2+(Subject)*age2, Ortho)
##D 
##D # use simplified formula avoiding unnecessary terms
##D fit.anovaMM2 <- anovaMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2, Ortho)
##D 
##D # and exclude intercept
##D fit.anovaMM3 <- anovaMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
##D 
##D # compare results
##D fit.lme
##D fit.anovaMM1
##D fit.anovaMM2
##D fit.anovaMM3
##D 
##D # are there a sex-specific differences?
##D cmat <- getL(fit.anovaMM3, c("SexMale-SexFemale", "SexMale:age2-SexFemale:age2")) 
##D cmat
##D 			 
##D test.fixef(fit.anovaMM3, L=cmat)
##D 
##D # former versions of the package used R-function 'lm' and 'anova',
##D # which is significantly slower for sufficiently large/complex models
##D data(realData)
##D datP1 <- realData[realData$PID==1,]
##D system.time(anova.lm.Tab <- anova(lm(y~lot/calibration/day/run, datP1)))
##D # using the quadratic forms approach for estimating ANOVA Type-1 sums of squares
##D system.time(anovaMM.Tab1  <- anovaMM(y~lot/calibration/day/run, datP1, SSQ.method="qf"))
##D # using the sweeping approach for estimating ANOVA Type-1 sums of squares
##D # this is now the default setting (Note: only "gb" method works as VarVC.method)
##D # Also see ?anovaVCA for a comparison of the computational efficiency of "qf" and "sweep".
##D system.time(anovaMM.Tab2  <- anovaMM(y~lot/calibration/day/run, datP1, SSQ.method="sweep"))
##D 
##D # compare results, note that the latter corresponds to a linear model,
##D # i.e. without random effects. Various matrices have already been computed,
##D # e.g. "R", "V" (which are identical in this case).
##D anova.lm.Tab
##D anovaMM.Tab1
##D anovaMM.Tab2
## End(Not run)




