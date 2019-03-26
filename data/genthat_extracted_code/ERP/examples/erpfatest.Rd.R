library(ERP)


### Name: erpfatest
### Title: Adaptive Factor-Adjustement for multiple testing of ERP data
### Aliases: erpfatest

### ** Examples


## Not run: 
##D 
##D data(impulsivity)
##D 
##D # Paired t-tests for the comparison of the ERP curves in the two conditions, 
##D # within experimental group High, at channel CPZ
##D 
##D erpdta.highCPZ = impulsivity[(impulsivity$Group=="High")&(impulsivity$Channel=="CPZ"),5:505] 
##D    # ERP curves for subjects in group 'High', at channel CPZ
##D covariates.highCPZ = impulsivity[(impulsivity$Group=="High")&(impulsivity$Channel=="CPZ"),1:4]
##D covariates.highCPZ = droplevels(covariates.highCPZ)
##D    # Experimental covariates for subjects in group 'High', at channel CPZ
##D 
##D design = model.matrix(~C(Subject,sum)+Condition,data=covariates.highCPZ)
##D    # Design matrix to compare ERP curves in the two conditions
##D design0 = model.matrix(~C(Subject,sum),data=covariates.highCPZ)
##D    # Design matrix for the null model (no condition effect)
##D 
##D tests = erpfatest(erpdta.highCPZ,design,design0,nbf=NULL,wantplot=TRUE,significance="none")
##D    # with nbf=NULL and significance="none", just to choose a number of factors
##D Ftest = erpFtest(erpdta.highCPZ,design,design0,nbf=6)
##D    # with nbf=6 (approximate conservative recommendation based on the variance inflation plot)
##D    # Signal detection: test for an eventual condition effect.
##D Ftest$pval
##D 
##D tests = erpfatest(erpdta.highCPZ,design,design0,nbf=6)
##D    # Signal identification: which are the significant intervals?
##D 
##D time_pt = seq(0,1000,2)     # sequence of time points (1 time point every 2ms in [0,1000])
##D nbs = 20                    # Number of B-splines for the plot of the effect curve
##D effect=which(colnames(design)=="ConditionSuccess")
##D erpplot(erpdta.highCPZ,design=design,frames=time_pt,effect=effect,xlab="Time (ms)",
##D         ylab=expression(Effect~curve~(mu~V)),bty="l",ylim=c(-3,3),nbs=nbs,
##D         cex.axis=1.25,cex.lab=1.25,interval="simultaneous")
##D    # with interval="simultaneous", both the pointwise and the simultaneous confidence bands
##D    # are plotted
##D points(time_pt[tests$significant],rep(0,length(tests$significant)),pch=16,col="blue")
##D    # Identifies significant time points by blue dots
##D title("Success-Failure effect curve with 95 percent C.I.",cex.main=1.25)
##D mtext(paste("12 subjects - Group 'High' - ",nbs," B-splines",sep=""),cex=1.25)
##D 
## End(Not run)
 



