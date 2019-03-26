library(DSviaDRM)


### Name: DS
### Title: Identification of disease similarity
### Aliases: DS
### Keywords: disease similarity pathway

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

#########################################################################
### computate dCs of pathways for each disease.
#data(pathways)
#DCpathway.AA.res<-DCpathway(DCEA.res=DCEA.AA.res, DisName="AA",pathways)
#DCpathway.CKD.res<-DCpathway(DCEA.res=DCEA.CKD.res, DisName="CKD",pathways)
#DCpathway.T2D.res<-DCpathway(DCEA.res=DCEA.T2D.res, DisName="T2D",pathways)
#########################################################################

#########################################################################
### computate disease similarities.
#DCpathway.disn = cbind(DCpathway.AA.res, DCpathway.CKD.res, DCpathway.T2D.res)
#DCEA.disn = list(dis1 = DCEA.AA.res, dis2 = DCEA.CKD.res, dis3 = DCEA.T2D.res)
#DS.res<-DS(DCpathway.disn , Ndis = 3, DCEA.disn , 
#	DisNames = c("AA", "CKD", "T2D"), pathways, cutoff=0.05,
#	Nper = 0, 
#	FigName = "DisNetwork.pdf", vsize = 5, lcex = 0.3, ewidth = 1)
#DS.res[1:3,]
##########################################################################



