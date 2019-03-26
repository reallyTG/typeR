library(VCA)


### Name: VCAinference
### Title: Inferential Statistics for VCA-Results.
### Aliases: VCAinference

### ** Examples

## Not run: 
##D 
##D # load data (CLSI EP05-A2 Within-Lab Precision Experiment) 
##D data(dataEP05A2_1)
##D 
##D # perform (V)variance (C)component (A)nalysis (also comute A-matrices)
##D res <- anovaVCA(y~day/run, dataEP05A2_1)
##D 
##D # get confidence intervals for total and error (VC, SD, CV)
##D VCAinference(res)
##D 
##D # additionally request CIs for all other VCs; default is to constrain 
##D # CI-limits to be >= 0
##D # first solve MME
##D res <- solveMME(res)
##D VCAinference(res, VarVC=TRUE)
##D 
##D # now using Satterthwaite methodology for CIs
##D VCAinference(res, VarVC=TRUE, ci.method="satt")
##D 
##D # request unconstrained CIs
##D VCAinference(res, VarVC=TRUE, constrainCI=FALSE)
##D 
##D # additionally request Chi-Squared Tests of total and error, default 
##D # is that claim values are specified as variances (claim.type="VC")
##D VCAinference(res, total.claim=4.5, error.claim=3.5)
##D 
##D # perform Chi-Squared Tests, where claim-values are given as SD, 
##D # compare p-values to former example
##D VCAinference(res, total.claim=sqrt(4.5), error.claim=sqrt(3.5), claim.type="SD")
##D 
##D # now using Satterthwaite methodology for CIs
##D VCAinference(res, total.claim=sqrt(4.5), error.claim=sqrt(3.5), 
##D 				claim.type="SD", ci.method="satt")
##D 
##D # now add random error to example data forcing the ANOVA-estimate of the 
##D # day-variance to be negative
##D set.seed(121)
##D tmpData <- dataEP05A2_1
##D tmpData$y <- tmpData$y + rnorm(80,,3)
##D res2 <- anovaVCA(y~day/run, tmpData)
##D 
##D # call 'VCAinference' with default settings
##D VCAinference(res2)
##D 
##D # extract components of the returned 'VCAinference' object
##D inf <- VCAinference(res2, total.claim=12)
##D inf$ConfInt$VC$OneSided			# one-sided CIs for variance components
##D inf$ConfInt$VC$TwoSided			# two-sided CI for variance components
##D inf$ChiSqTest
##D 
##D # request CIs for all VCs, default is to exclude CIs of negative VCs (excludeNeg=TRUE) 
##D # solve MMEs first (or set MME=TRUE when calling anovaVCA)
##D res2 <- solveMME(res2)
##D VCAinference(res2, VarVC=TRUE)
##D 
##D # request CIs for all VCs, including those for negative VCs, note that all CI-limits 
##D # are constrained to be >= 0
##D VCAinference(res2, VarVC=TRUE, excludeNeg=FALSE)
##D 
##D # request unconstrained CIs for all VCs, including those for negative VCS
##D # one has to re-fit the model allowing the VCs to be negative
##D res3 <- anovaVCA(y~day/run, tmpData, NegVC=TRUE, MME=TRUE)
##D VCAinference(res3, VarVC=TRUE, excludeNeg=FALSE, constrainCI=FALSE)
##D  
##D ### use the numerical example from the CLSI EP05-A2 guideline (p.25)
##D data(Glucose)
##D res.ex <- anovaVCA(conc~day/run, Glucose)
##D 
##D ### also perform Chi-Squared tests
##D ### Note: in guideline claimed SD-values are used, here, claimed variances are used
##D VCAinference(res.ex, total.claim=3.4^2, error.claim=2.5^2)
##D 
##D 
##D # load another example dataset and extract the "sample_1" subset
##D data(VCAdata1)
##D sample1 <- VCAdata1[which(VCAdata1$sample==1),]
##D 
##D # generate an additional factor variable and random errors according to its levels
##D sample1$device <- gl(3,28,252)                                      
##D set.seed(505)
##D sample1$y <- sample1$y + rep(rep(rnorm(3,,.25), c(28,28,28)),3)     
##D 
##D # fit a crossed-nested design with main factors 'lot' and 'device' 
##D # and nested factors 'day' and 'run' nested below, also request A-matrices 
##D res1 <- anovaVCA(y~(lot+device)/day/run, sample1) 
##D 
##D # get confidence intervals, covariance-matrix of VCs, ..., 
##D # explicitly request the covariance-matrix of variance components
##D # solve MMEs first
##D res1 <- solveMME(res1)
##D inf1 <- VCAinference(res1, VarVC=TRUE, constrainCI=FALSE)
##D inf1
##D 
##D # print numerical values with more digits
##D print(inf1, digit=12)
##D 
##D # print only parts of the 'VCAinference' object (see \code{print.VCAinference})
##D print(inf1, digit=12, what=c("VCA", "VC"))
##D 
##D # extract complete covariance matrix of variance components 
##D # (main diagonal is part of standard output -> "Var(VC"))
##D VarCovVC <- vcovVC(inf1$VCAobj)
##D round(VarCovVC, 12)
##D 
##D # use by-processing and specific argument-values for each level of the by-variable
##D data(VCAdata1)
##D fit.all <- anovaVCA(y~(device+lot)/day/run, VCAdata1, by="sample", NegVC=TRUE)
##D inf.all <- VCAinference(fit.all, total.claim=c(.1,.75,.8,1,.5,.5,2.5,20,.1,1))
##D print.VCAinference(inf.all, what="VC")
## End(Not run)



