library(VCA)


### Name: fitLMM
### Title: Fit Linear Mixed Model by ANOVA or REML.
### Aliases: fitLMM

### ** Examples

## Not run: 
##D data(dataEP05A2_2)
##D 
##D # assuming 'day' as fixed, 'run' as random
##D # Note: default method is "anova"
##D fitLMM(y~day/(run), dataEP05A2_2)
##D 
##D # explicitly request "reml"
##D fitLMM(y~day/(run), dataEP05A2_2, method="reml")
##D 
##D # assuming both as random leads to same results as
##D # calling anovaVCA (ANOVA is the default)
##D fitLMM(y~(day)/(run), dataEP05A2_2)
##D anovaVCA(y~day/run, dataEP05A2_2)
##D 
##D # now using REML-estimation
##D fitLMM(y~(day)/(run), dataEP05A2_2, "reml")
##D remlVCA(y~day/run, dataEP05A2_2)
##D 
##D # use different approaches to estimating the covariance of 
##D # variance components (covariance parameters)
##D # create unbalanced data
##D dat.ub <- dataEP05A2_2[-c(11,12,23,32,40,41,42),]
##D m1.ub <- fitLMM(y~day/(run), dat.ub, SSQ.method="qf", VarVC.method="scm")
##D # VarVC.method="gb" is an approximation not relying on quadratic forms
##D m2.ub <- fitLMM(y~day/(run), dat.ub, SSQ.method="qf", VarVC.method="gb")		
##D # REML-estimated variance components usually differ from ANOVA-estimates
##D # and so do the variance-covariance matrices
##D m3.ub <- fitLMM(y~day/(run), dat.ub, "reml", VarVC=TRUE)		
##D V1.ub <- round(vcovVC(m1.ub), 12)
##D V2.ub <- round(vcovVC(m2.ub), 12)
##D V3.ub <- round(vcovVC(m3.ub), 12)
##D 
##D # fit a larger random model
##D data(VCAdata1)
##D fitMM1 <- fitLMM(y~((lot)+(device))/(day)/(run), VCAdata1[VCAdata1$sample==1,])
##D fitMM1
##D # now use function tailored for random models
##D fitRM1 <- anovaVCA(y~(lot+device)/day/run, VCAdata1[VCAdata1$sample==1,])
##D fitRM1
##D 
##D # there are only 3 lots, take 'lot' as fixed 
##D fitMM2 <- fitLMM(y~(lot+(device))/(day)/(run), VCAdata1[VCAdata1$sample==2,])
##D # use REML on this (balanced) data
##D fitMM2.2 <- fitLMM(y~(lot+(device))/(day)/(run), VCAdata1[VCAdata1$sample==2,], "reml")
##D 
##D # the following model definition is equivalent to the one above,
##D # since a single random term in an interaction makes the interaction
##D # random (see the 3rd reference for details on this topic)
##D fitMM3 <- fitLMM(y~(lot+(device))/day/run, VCAdata1[VCAdata1$sample==2,])
##D 
##D # fit same model for each sample using by-processing
##D lst <- fitLMM(y~(lot+(device))/day/run, VCAdata1, by="sample")
##D lst
##D 
##D # fit mixed model originally from 'nlme' package
##D  
##D library(nlme)
##D data(Orthodont)
##D fit.lme <- lme(distance~Sex*I(age-11), random=~I(age-11)|Subject, Orthodont) 
##D 
##D # re-organize data
##D Ortho <- Orthodont
##D Ortho$age2 <- Ortho$age - 11
##D Ortho$Subject <- factor(as.character(Ortho$Subject))
##D fit.anovaMM1 <- fitLMM(distance~Sex*age2+(Subject)*age2, Ortho)
##D 
##D # use simplified formula avoiding unnecessary terms
##D fit.anovaMM2 <- fitLMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2, Ortho)
##D 
##D # and exclude intercept
##D fit.anovaMM3 <- fitLMM(distance~Sex+Sex:age2+(Subject)+(Subject):age2-1, Ortho)
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
##D # fit LMM with fixed lot and device effects and test for lot-differences
##D data(VCAdata1)
##D fitS5 <- fitLMM(y~(lot+device)/(day)/(run), subset(VCAdata1, sample==5), "reml")
##D fitS5
##D 
##D # apply Tukey-HSD test to screen for lot differences
##D library(multcomp)
##D res.tuk <- glht(fitS5, linfct=mcp(lot="Tukey"))
##D summary(res.tuk)
##D 
##D # compact letter display
##D res.tuk.cld <- cld(res.tuk, col=paste0("gray", c(90,60,75)))
##D plot(res.tuk.cld)
## End(Not run)



