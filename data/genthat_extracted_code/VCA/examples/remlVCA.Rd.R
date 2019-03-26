library(VCA)


### Name: remlVCA
### Title: Perform (V)ariance (C)omponent (A)nalysis via REML-Estimation.
### Aliases: remlVCA

### ** Examples

## Not run: 
##D 
##D # a VCA standard example
##D data(dataEP05A2_3)
##D 
##D # fit it by ANOVA first, then by REML
##D fit0 <- anovaVCA(y~day/run, dataEP05A2_3) 
##D fit1 <- remlVCA(y~day/run, dataEP05A2_3)
##D fit0
##D fit1
##D  
##D # make example unbalanced
##D set.seed(107)
##D dat.ub <- dataEP05A2_3[-sample(1:80, 7),]
##D fit0ub <- anovaVCA(y~day/run, dat.ub) 
##D fit1ub <- remlVCA(y~day/run, dat.ub) 
##D 
##D # not that ANOVA- and REML-results now differ
##D fit0ub
##D fit1ub
##D 
##D ### Use the six sample reproducibility data from CLSI EP5-A3
##D ### and fit per sample reproducibility model
##D data(CA19_9)
##D fit.all <- remlVCA(result~site/day, CA19_9, by="sample")
##D 
##D reproMat <- data.frame(
##D  Sample=c("P1", "P2", "Q3", "Q4", "P5", "Q6"),
##D  Mean= c(fit.all[[1]]$Mean, fit.all[[2]]$Mean, fit.all[[3]]$Mean, 
##D 	        fit.all[[4]]$Mean, fit.all[[5]]$Mean, fit.all[[6]]$Mean),
##D 	Rep_SD=c(fit.all[[1]]$aov.tab["error","SD"], fit.all[[2]]$aov.tab["error","SD"],
##D 	         fit.all[[3]]$aov.tab["error","SD"], fit.all[[4]]$aov.tab["error","SD"],
##D           fit.all[[5]]$aov.tab["error","SD"], fit.all[[6]]$aov.tab["error","SD"]),
##D 	Rep_CV=c(fit.all[[1]]$aov.tab["error","CV[%]"],fit.all[[2]]$aov.tab["error","CV[%]"],
##D           fit.all[[3]]$aov.tab["error","CV[%]"],fit.all[[4]]$aov.tab["error","CV[%]"],
##D           fit.all[[5]]$aov.tab["error","CV[%]"],fit.all[[6]]$aov.tab["error","CV[%]"]),
##D  WLP_SD=c(sqrt(sum(fit.all[[1]]$aov.tab[3:4,"VC"])),sqrt(sum(fit.all[[2]]$aov.tab[3:4, "VC"])),
##D           sqrt(sum(fit.all[[3]]$aov.tab[3:4,"VC"])),sqrt(sum(fit.all[[4]]$aov.tab[3:4, "VC"])),
##D           sqrt(sum(fit.all[[5]]$aov.tab[3:4,"VC"])),sqrt(sum(fit.all[[6]]$aov.tab[3:4, "VC"]))),
##D  WLP_CV=c(sqrt(sum(fit.all[[1]]$aov.tab[3:4,"VC"]))/fit.all[[1]]$Mean*100,
##D           sqrt(sum(fit.all[[2]]$aov.tab[3:4,"VC"]))/fit.all[[2]]$Mean*100,
##D           sqrt(sum(fit.all[[3]]$aov.tab[3:4,"VC"]))/fit.all[[3]]$Mean*100,
##D           sqrt(sum(fit.all[[4]]$aov.tab[3:4,"VC"]))/fit.all[[4]]$Mean*100,
##D           sqrt(sum(fit.all[[5]]$aov.tab[3:4,"VC"]))/fit.all[[5]]$Mean*100,
##D           sqrt(sum(fit.all[[6]]$aov.tab[3:4,"VC"]))/fit.all[[6]]$Mean*100),
##D  Repro_SD=c(fit.all[[1]]$aov.tab["total","SD"],fit.all[[2]]$aov.tab["total","SD"],
##D             fit.all[[3]]$aov.tab["total","SD"],fit.all[[4]]$aov.tab["total","SD"],
##D             fit.all[[5]]$aov.tab["total","SD"],fit.all[[6]]$aov.tab["total","SD"]),
##D  Repro_CV=c(fit.all[[1]]$aov.tab["total","CV[%]"],fit.all[[2]]$aov.tab["total","CV[%]"],
##D             fit.all[[3]]$aov.tab["total","CV[%]"],fit.all[[4]]$aov.tab["total","CV[%]"],
##D             fit.all[[5]]$aov.tab["total","CV[%]"],fit.all[[6]]$aov.tab["total","CV[%]"]))
##D   
##D  for(i in 3:8) reproMat[,i] <- round(reproMat[,i],digits=ifelse(i%%2==0,1,3))
##D  reproMat
##D 
##D # now plot the precision profile over all samples
##D plot(reproMat[,"Mean"], reproMat[,"Rep_CV"], type="l", main="Precision Profile CA19-9",
##D 		xlab="Mean CA19-9 Value", ylab="CV[%]")
##D grid()
##D points(reproMat[,"Mean"], reproMat[,"Rep_CV"], pch=16)
##D 
##D 
##D # REML-estimation not yes optimzed to the same degree as
##D # ANOVA-estimation. Note, that no variance-covariance matrix
##D # for the REML-fit is computed (VarVC=FALSE)!
##D # Note: A correct analysis would be done per-sample, this is just
##D #       for illustration.
##D data(VCAdata1)
##D system.time(fit0 <- anovaVCA(y~sample+(device+lot)/day/run, VCAdata1))
##D system.time(fit1 <- remlVCA(y~sample+(device+lot)/day/run, VCAdata1, VarVC=FALSE))
##D 
##D # The previous example will also be interesting for environments using MKL.
##D # Run it once in a GNU-R environment and once in a MKL-environment
##D # and compare computational time of both. Note, that 'VarVC' is now set to TRUE
##D # and variable "sample" is put into the brackets increasing the number of random
##D # effects by factor 10. On my Intel Xeon E5-2687W 3.1 GHz workstation it takes
##D # ~ 400s with GNU-R and ~25s with MKL support (MRO) both run under Windows.
##D system.time(fit2 <- remlVCA(y~(sample+device+lot)/day/run, VCAdata1, VarVC=TRUE))
##D 
##D # using the SWEEP-Operator is even faster but the variance-covariance matrix of
##D # VC is not automatically approximated as for fitting via REML
##D system.time(fit3 <- anovaVCA(y~(sample+device+lot)/day/run, VCAdata1))
##D fit2
##D fit3
## End(Not run)



