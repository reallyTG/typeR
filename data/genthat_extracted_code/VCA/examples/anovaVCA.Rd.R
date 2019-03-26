library(VCA)


### Name: anovaVCA
### Title: ANOVA-Type Estimation of Variance Components for Random Models.
### Aliases: anovaVCA

### ** Examples

## Not run: 
##D 
##D # load data (CLSI EP05-A2 Within-Lab Precision Experiment) 
##D data(dataEP05A2_2)
##D 
##D # perform ANOVA-estimation of variance components
##D res <- anovaVCA(y~day/run, dataEP05A2_2)
##D res
##D 
##D # design with two main effects (ignoring the hierarchical structure of the design)
##D anovaVCA(y~day+run, dataEP05A2_2)
##D 
##D # compute confidence intervals, perform F- and Chi-Squared tests
##D INF <- VCAinference(res, total.claim=3.5, error.claim=2)
##D INF
##D 
##D ### load data from package
##D data(VCAdata1)
##D 
##D data_sample1 <- VCAdata1[VCAdata1$sample==1,]
##D 
##D ### plot data for visual inspection
##D varPlot(y~lot/day/run, data_sample1)
##D 
##D ### estimate VCs for 4-level hierarchical design (error counted) for sample_1 data
##D anovaVCA(y~lot/day/run, data_sample1)
##D 
##D ### using different model (ignoring the hierarchical structure of the design)
##D anovaVCA(y~lot+day+lot:day:run, data_sample1)
##D 
##D ### same model with unbalanced data
##D anovaVCA(y~lot+day+lot:day:run, data_sample1[-c(1,11,15),])
##D 
##D ### use the numerical example from the CLSI EP05-A2 guideline (p.25)
##D data(Glucose)
##D res.ex <- anovaVCA(result~day/run, Glucose)
##D 
##D ### also perform Chi-Squared tests
##D ### Note: in guideline claimed SD-values are used, here, claimed variances are used
##D VCAinference(res.ex, total.claim=3.4^2, error.claim=2.5^2)
##D 
##D ### now use the six sample reproducibility data from CLSI EP5-A3
##D ### and fit per sample reproducibility model
##D data(CA19_9)
##D fit.all <- anovaVCA(result~site/day, CA19_9, by="sample")
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
##D # load another example dataset and extract the "sample==1" subset
##D data(VCAdata1)
##D sample1 <- VCAdata1[which(VCAdata1$sample==1),]
##D  
##D # generate an additional factor variable and random errors according to its levels
##D sample1$device <- gl(3,28,252)                                      
##D set.seed(505)
##D sample1$y <- sample1$y + rep(rep(rnorm(3,,.25), c(28,28,28)),3)     
##D 
##D # fit a crossed-nested design with main factors 'lot' and 'device' 
##D # and nested factors 'day' and 'run' nested below 
##D res1 <- anovaVCA(y~(lot+device)/day/run, sample1) 
##D res1
##D 
##D # fit same model for each sample using by-processing
##D lst <- anovaVCA(y~(lot+device)/day/run, VCAdata1, by="sample")
##D lst
##D 
##D # now fitting a nonsense model on the complete dataset "VCAdata1" 
##D # using both methods for fitting ANOVA Type-1 sum of squares
##D # SSQ.method="qf" used to be the default up to package version 1.1.1
##D # took ~165s on a Intel Xeon E5-2687W (3.1GHz) in V1.1.1, now takes ~25s
##D system.time(res.qf <- anovaVCA(y~(sample+lot+device)/day/run, VCAdata1, SSQ.method="qf"))
##D # the SWEEP-operator is the new default since package version 1.2
##D # takes ~5s
##D system.time(res.sw <- anovaVCA(y~(sample+lot+device)/day/run, VCAdata1, SSQ.method="sweep"))
##D # applying functions 'anova' and 'lm' in the same manner takes ~ 265s
##D system.time(res.lm <- anova(lm(y~(sample+lot+device)/day/run, VCAdata1)))
##D res.qf
##D res.sw
##D res.lm
## End(Not run)



