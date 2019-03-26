library(DSviaDRM)


### Name: comDCGLplot
### Title: Visualization of common DCGs and DCLs
### Aliases: comDCGLplot
### Keywords: visualization DCGs DCLs

### ** Examples

##################################################################
## computate DCEA results for three disease, Allergic asthma (AA), 
## Chronic kidney disease (CKD) and Type 2 Diabetes (T2D).
##################################################################
data(exprs1)
data(exprs2)
data(exprs3)

##########################################################################
## the default value of cutoff in DCEA is 0.25, 
## here cutoff is set to 1 for saving time when demonstrating the examples.
DCEA.AA.res<-DCEA(exprs1[1:200,1:5],exprs1[1:200,6:10],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
DCEA.CKD.res<-DCEA(exprs2[1:300,1:25],exprs2[1:300,26:31],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
DCEA.T2D.res<-DCEA(exprs3[1:200,1:12],exprs3[1:200,13:35],link.method="percent",
	cutoff=1,N=0,nbins=20,p=0.1) 
##########################################################################

#####################################################
## sort out common DCGs and DCLs in AA, CKD and T2D.
data(tf2target)
comDCGL.res<-comDCGL(Ndis = 3, 
	DCEA.disn = list(dis1 = DCEA.AA.res, dis2 = DCEA.CKD.res, dis3 = DCEA.T2D.res), 
	DisNames = c("AA", "CKD", "T2D"), 
	cutoff = 0.25, tf2target)
#####################################################

#################################################################
## plot common DCGs and common DCLs with regulation information.
#comDCGLplot.res<-comDCGLplot(comDCGL.res,FigName="comDCGL.pdf",tf2target,
#	vsize=5,asize=0.25,lcex=0.3,ewidth=1.5)
#################################################################



