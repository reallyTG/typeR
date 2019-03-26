library(Biolinv)


### Name: simulacro
### Title: Builds a simulated biological invasion dataset.
### Aliases: simulacro

### ** Examples

data('frogsEM')  #see example in ?EM().
data('nzp')

idst<- frogsEM[1:10,]
Cr<- frogsEM[-(1:10),]
yr<- unique(Cr$year)

nNoYear<- rep(NA,length(unique(Cr$year)))
hNoYear<- rep(NA,length(unique(Cr$year)))

for(i in 1:length(unique(Cr$year))){
 CrYear<- Cr[Cr$year==unique(Cr$year)[i],]  #Cr for that year
 nNoYear[i]<- nrow(CrYear[CrYear$Pnat>=.5,])  #natural points for that year
 hNoYear[i]<- nrow(CrYear[CrYear$Pnat<.5,])  #human points for that year
}

AV<- c(2,3,4.5,7.5,11,15,20,25)  #alpha values

## Not run: 
##D frogsLacro<- simulacro(INIDIST=idst,YEARS=yr,
##D  BOUNDARY=nzp,NNAT=nNoYear,NANTH=hNoYear,
##D  FACNAT=10,
##D  A=AV,X=seq(.1,30,.1),
##D  TRUEANTH=TRUE,TRUEDB=Cr,PROB=.5,
##D  ITERATIONS=10,HSM=nzp)
##D  
## End(Not run)



