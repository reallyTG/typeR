library(ERP)


### Name: erpFtest
### Title: Functional Analysis-of-Variance (Anova) testing of Event-Related
###   Potentials (ERP) data
### Aliases: erpFtest

### ** Examples

data(impulsivity)

# Comparison of ERP curves in the two conditions, within experimental group 'High', at channel CPZ 

erpdta.highCPZ = impulsivity[(impulsivity$Group=="High")&(impulsivity$Channel=="CPZ"),5:505] 
   # ERP curves for subjects in group 'High'
covariates.highCPZ = impulsivity[(impulsivity$Group=="High")&(impulsivity$Channel=="CPZ"),1:4]
covariates.highCPZ = droplevels(covariates.highCPZ)
   # Experimental covariates for subjects in group 'High'

design = model.matrix(~C(Subject,sum)+Condition,data=covariates.highCPZ)
   # Design matrix to compare ERP curves in the two conditions
design0 = model.matrix(~C(Subject,sum),data=covariates.highCPZ)
   # Design matrix for the null model (no condition effect)

Ftest = erpFtest(erpdta.highCPZ,design,design0,nbf=NULL,wantplot=TRUE,pvalue="none")
   # with pvalue="none", just to choose a number of factors
Ftest = erpFtest(erpdta.highCPZ,design,design0,nbf=6)
Ftest$pval          # p-value of the Generalized LRT statistic
Ftest$pval.Fols     # p-value of the LRT statistic when time-dependence is ignored

time_pt = seq(0,1000,2)     # sequence of time points (1 time point every 2ms in [0,1000])
nbs = 20                    # Number of B-splines for the plot of the effect curve
effect=which(colnames(design)=="ConditionSuccess")
erpplot(erpdta.highCPZ,design=design,frames=time_pt,effect=effect,xlab="Time (ms)",
        ylab=expression(Effect~curve~(mu~V)),bty="l",ylim=c(-3,3),nbs=nbs,
        cex.axis=1.25,cex.lab=1.25,interval="simultaneous")
   # with interval="simultaneous", both the pointwise and the simultaneous confidence bands
   # are plotted
title("Success-Failure effect curve with 95 percent C.I.",cex.main=1.25)
mtext(paste("12 subjects - Group 'High' - ",nbs," B-splines",sep=""),cex=1.25)




