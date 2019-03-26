library(MOJOV)


### Name: MOJOV.genoMatrix
### Title: A internal function. It generates a genotype matrix.
### Aliases: MOJOV.genoMatrix

### ** Examples

#Generating individuals ID for genotype file at random.
genoIID<-paste("ID",floor(runif(2000,1,101)),sep="")
#Generating variants labels for genotype file at random.
genoVariant<-paste("rs",floor(runif(2000,223,250)),sep="")
#Generating genotype code for genotype file at random.
genoH<-floor(runif(2000,1,3))
#Generating individuals ID for phenotype file.
phenoIID<-paste("ID",1:100,sep="")
#Generating genotype matrix.
x<-MOJOV.genoMatrix(genoIID=genoIID,genoVariant=genoVariant,genoH=genoH,
         phenoIID=phenoIID)



