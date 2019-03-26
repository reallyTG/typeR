library(PROMETHEE)


### Name: PROMETHEE
### Title: Preference Ranking Organization METHod for Enrichment of
###   Evaluations
### Aliases: PROMETHEE

### ** Examples



# Dataset
dati<-as.data.frame(cbind(c(10,25,4,2),
                          c(250000,270000,320000,350000),
                          c(3,4,2,2),
                          c(20,10,15,7)))

colnames(dati) = c("Distance.to.work","Price","Bedrooms","Age")


# PreferenceF
PreF<-as.data.frame(rbind(c("Gaussian","Linear","V-shape","Level"),
                     c("Gaussian","Linear","V-shape","Level"),
                     c("Gaussian","Linear","V-shape","Level"),
                     c("Gaussian","Linear","V-shape","Level")))
colnames(PreF) = c("Distance.to.work","Price","Bedrooms","Age")


# PreferenceT
PreT<-as.data.frame(cbind(c(2,2,2,2),
                          c(50000,50000,50000,50000),
                          c(2,2,2,2),
                          c(5,5,5,5)))
colnames(PreT) = c("Distance.to.work","Price","Bedrooms","Age")


# IndifferenceT
IndT<-as.data.frame(cbind(c(1,1,1,1),
                          c(10000,10000,10000,10000),
                          c(0,0,0,0),
                          c(2,2,2,2)))
colnames(IndT) = c("Distance.to.work","Price","Bedrooms","Age")


#Weights
Weig<-as.data.frame(cbind(c(0.25,0.25,0.25,0.25),
                          c(0.25,0.25,0.25,0.25),
                          c(0.25,0.25,0.25,0.25),
                          c(0.25,0.25,0.25,0.25)))
colnames(Weig) = c("Distance.to.work","Price","Bedrooms","Age")


# Min_Max
MiMa<-as.data.frame(cbind(c("min","min","min","min"),
                          c("min","min","min","min"),
                          c("max","max","max","max"),
                          c("min","min","min","min")))
colnames(MiMa) = c("Distance.to.work","Price","Bedrooms","Age")


#S_Gauss
gauss<-as.data.frame(cbind(c(2,2,2,2),
                          c(0,0,0,0),
                          c(0,0,0,0),
                          c(0,0,0,0)))
colnames(gauss) = c("Distance.to.work","Price","Bedrooms","Age")


###############################

PF = PROMETHEE(dati, PreF,PreT,IndT,Weig,MiMa,gauss)

###############################

PCA_UNIC <- prcomp(PF$UnicriterionNetFlows,center = TRUE,scale. = TRUE)
GAIA=predict(PCA_UNIC)[,1:2]
rownames(GAIA)=rownames(dati)
print(GAIA)




