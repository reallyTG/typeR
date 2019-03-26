library(VCA)


### Name: remlMM
### Title: Fit Linear Mixed Models via REML.
### Aliases: remlMM

### ** Examples

## Not run: 
##D data(dataEP05A2_2)
##D 
##D # assuming 'day' as fixed, 'run' as random
##D remlMM(y~day/(run), dataEP05A2_2)
##D 
##D # assuming both as random leads to same results as
##D # calling anovaVCA
##D remlMM(y~(day)/(run), dataEP05A2_2)
##D anovaVCA(y~day/run, dataEP05A2_2)
##D remlVCA(y~day/run, dataEP05A2_2)
##D 
##D # fit a larger random model
##D data(VCAdata1)
##D fitMM1 <- remlMM(y~((lot)+(device))/(day)/(run), VCAdata1[VCAdata1$sample==1,])
##D fitMM1
##D # now use function tailored for random models
##D fitRM1 <- anovaVCA(y~(lot+device)/day/run, VCAdata1[VCAdata1$sample==1,])
##D fitRM1
##D 
##D # there are only 3 lots, take 'lot' as fixed 
##D fitMM2 <- remlMM(y~(lot+(device))/(day)/(run), VCAdata1[VCAdata1$sample==2,])
##D 
##D # the following model definition is equivalent to the one above,
##D # since a single random term in an interaction makes the interaction
##D # random (see the 3rd reference for details on this topic)
##D fitMM3 <- remlMM(y~(lot+(device))/day/run, VCAdata1[VCAdata1$sample==2,])
##D 
##D # fit same model for each sample using by-processing
##D lst <- remlMM(y~(lot+(device))/day/run, VCAdata1, by="sample")
##D lst
##D 
##D # fit mixed model originally from 'nlme' package
##D  
##D library(nlme)
##D data(Orthodont)
##D fit.lme <- lme(distance~Sex*I(age-11), random=~I(age-11)|Subject, Orthodont) 
##D 
##D # re-organize data for using 'remlMM'
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D fit.remlMM1 <- remlMM(distance~Sex*age2+(Subject)*age2, Ortho)
##D 
##D # use simplified formula avoiding unnecessary terms
##D fit.remlMM2 <- remlMM(distance~Sex+age2+Sex:age2+(Subject)+age2:(Subject), Ortho)
##D 
##D # and exclude intercept
##D fit.remlMM3 <- remlMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
##D 
##D # now use exclude covariance of per-subject intercept and slope
##D # as for models fitted by function 'anovaMM'
##D fit.remlMM4 <- remlMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho, cov=FALSE)
##D 
##D # compare results
##D fit.lme
##D fit.remlMM1
##D fit.remlMM2
##D fit.remlMM3
##D fit.remlMM4
##D 
##D # are there a sex-specific differences?
##D cmat <- getL(fit.remlMM3, c("SexMale-SexFemale", "SexMale:age2-SexFemale:age2")) 
##D cmat
##D 			 
##D test.fixef(fit.remlMM3, L=cmat)
## End(Not run)



