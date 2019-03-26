library(PathSelectMP)


### Name: PathSelectMP-package
### Title: Backwards Variable Selection for paths using M Plus
### Aliases: PathSelectMP-package PathSelectMP
### Keywords: Variable Selection

### ** Examples

## Don't show: 
library(MplusAutomation)
library(mice)

mod<-function(x,m)
{
 t1<-floor(x/m)
 return(x-t1*m)
}

ConvertData3<-function(N1,N2,List1){
		NewList=c()
		for(i in 1:length(List1)){
			NewList=c(NewList,list(c((paste0(N1,List1[i])),(paste0(N2,List1[i])),c((List1[i])))))
			}
		return(NewList)}

Simulate<-function(n=1000,seedNum=1000,MissingYN=0,exampleNum=1){
	if(exampleNum==1){	
		set.seed(seed=seedNum)	
		#example 1
		W=rbinom(n,1,0.55)
		Y=rnorm(n)
		Z=rbinom(n,1,0.40)
	
		V1=2.5*Z
		V2=(1/(1+exp(-V1)))
		V3=rbinom(n,1,V2)

		X1=2.5*V3+W-0.5*Z
		X2=(1/(1+exp(-X1)))
		X3=rbinom(n,1,X2)

		NewData=data.frame(X3,V3,W,Z,Y)
		names(NewData)=c("X","V","W","Z","Y")
		}

	if(exampleNum==2){
		#example 2
		set.seed(seed=seedNum)	
		A=rbinom(n,1,0.55)
		B=rbinom(n,3,0.50)
		C=rnorm(n)
		E=rbinom(n,5,0.25)
		F=rnorm(n)
		W=rnorm(n)

		G=1.5*C+E+3.5
		G1=(1/(1+exp(-G)))
		G2=rbinom(n,3,G1)

		H=2.5*B+2*C+1-2*rnorm(n,1,2)
		H1=(1/(1+exp(-H)))
		H2=rbinom(n,2,H1)

		J=3*H-1+B+C
		J1=(1/(1+exp(-J)))
		J2=rbinom(n,2,J1)

		NewData=data.frame(J2,H2,G2,A,B,C,E,F,W)
		names(NewData)=c("J","H","G","A","B","C","E","F","W")
		}

	if(exampleNum==3){
		#example 3
		set.seed(seed=seedNum)	
		A=rbinom(n,1,0.55)+1
		B=rbinom(n,3,0.50)+1
		C=rnorm(n)+1
		E=rbinom(n,5,0.25)+1
		F=rnorm(n)+1

		G=1.5*A+E-4*C+2*F
		G1=(1/(1+exp(-G)))
		G2=rbinom(n,3,G1)

		H=2.5*B+2*C+1-2*rnorm(n,1,2)
		H1=(1/(1+exp(-H)))
		H2=rbinom(n,2,H1)

		J=3*H-1
		J1=(1/(1+exp(-J)))
		J2=rbinom(n,2,J1)

		NewData=data.frame(J2,H2,G2,A,B,C,E,F)
		names(NewData)=c("J","H","G","A","B","C","E","F")
		}


	if(MissingYN==1){
		for(i in 1:ncol(NewData)){
			Ch=sample(1:n,n*.1)
			NewData[Ch,i]=(-99)
			}		
		}
	return(NewData)}

##########################################################################
##########################################################################
#First part 
##start variable names with capital letter and avoid use of any symbols other than letters and numbers for variable names##

CreateInitializeMatrix<-function(InitialData,WhichCat,empty=FALSE){
	N=names(InitialData)
	InitMat=matrix(rep(0,length(N)*length(N)),nrow=length(N))
	InitDatF=data.frame(InitMat)
	names(InitDatF)=N
	row.names(InitDatF)=N
	if(empty==TRUE){
		return(InitDatF)
	}else{
		InitMat[upper.tri(InitMat)]=1
		InitMat[WhichCat!=1,]=0
		InitDatF=data.frame(InitMat)
		names(InitDatF)=N
		row.names(InitDatF)=N
		return(InitDatF)
		}
	}

OnlyNumberElement<-function(AllData,Number){
	return(AllData[[Number]])}

CheckVarNames<-function(InitialData){
	N=names(InitialData)
	G1=gregexpr("[A-Z]",N)
	G2=gregexpr("[a-z]",N)
	G3=gregexpr("[0-9]",N)
	GTot=rep(0,length(G1))
	for(i in 1:length(GTot)){
		GTot=c(as.numeric(G1[[i]]),as.numeric(G2[[i]]),as.numeric(G3[[i]]))
		if(as.numeric(G1[[i]])[1]!=1){
			print("error variable names must start with a capital letter")
			return("CheckFailed")
			}
		}
		if(length(which(GTot<1))!=0){
			GTot=GTot[-which(GTot<1)]
			}
		if(length(GTot)<nchar(N[i])){
			print("ERROR variable names must start with a capital letter and contain only letters and numbers: no special characters")
			return("CheckFailed")
			}
	return("Success")}
	

NumCat<-function(ColDes,DataMat,NADes){
	#NADes is the value for NA often -99
	ColDes=ColDes[[1]]
	DataVec=DataMat[,ColDes]
	CatNum=length(unique(DataVec[which((DataVec)!=NADes)]))
	return(CatNum)}

DatImputations<-function(InitialData,ImputeSeed,NADes,DataFileNameS,WhichCat,WhichImpute,WhichRowsImp,AllMethods){
	x2=InitialData
	for(i in 1:ncol(InitialData)){
		is.na(x2[which(x2[,i]==NADes[1]),i])=TRUE
		}
	for(i in 1:length(WhichCat)){
		if(WhichCat[i]==1){
			x2[,i]=as.factor(x2[,i])
			}
		}
	METHOD=rep("",ncol(x2))
	for(i in 1:length(WhichCat)){
		if(WhichImpute[i]==1){
			if(WhichCat[i]==1){
				Catnum=NumCat(i,InitialData,NADes)
				if(Catnum>2){
					METHOD[i]=AllMethods[2]
					}
				if(Catnum<=2){
					METHOD[i]=AllMethods[1]
					}
			}else{
				METHOD[i]=AllMethods[3]
				}
			}
		}
	y<-mice(x2,seed=ImputeSeed,method=METHOD)
	AllImputed<-y$imp
	NewImp=lapply(AllImputed,OnlyNumberElement,y$iteration)
	SaveX=x2
	for(k in 1:length(NewImp)){
		if(length(NewImp[[i]])!=0){
			IsNa=which(is.na(x2[,k])==TRUE)
			MTCH=match(IsNa,WhichRowsImp)
			MTCH=MTCH[which(is.na(MTCH)==FALSE)]
			MTCH2=match(IsNa,WhichRowsImp[MTCH])
			MTCH2=MTCH2[which(is.na(MTCH2)==FALSE)]
			KeepRowsImp=WhichRowsImp[MTCH]
			SaveX[KeepRowsImp,k]=NewImp[[k]][MTCH2]
			}
		}
	ID=seq(1,nrow(SaveX))
	SaveX=cbind(SaveX,ID)
	for(i in 1:ncol(SaveX)){
		SaveX[,i]=as.character(SaveX[,i])
		SaveX[which(is.na(SaveX[,i])==TRUE),i]=as.character(NADes)
		}	
	write.table(SaveX,DataFileNameS,sep="\t",row.names=FALSE,col.names=FALSE)
	return()}

AddOnINDStatements<-function(MeanDirectList,PasteIND){
	x<-MeanDirectList
	Keep=c()
	Keep2=c()
	PasteInd=PasteIND
	binseq <- function (v=c(),start,Nz,x){
		if(length(Nz)<1){
			cat((v),"\n")
		return ()
		} else {
			StartPos=which(row.names(x)==start)
			Nz=which(abs(x[StartPos,])>0.001)
			for(i in 1:length(Nz)){
				cat((v),"\n")
				Rn=row.names(x)
				binseq(v=c(v ,start),start=Rn[Nz[i]],Nz,x)

			}
		}
	} 
	if(PasteIND==1){
		for(j in 1:length(names(x))){
			StoreB=capture.output(binseq(start=names(x)[j],Nz=c(3,4),x=x))
			Keep=unique(StoreB)
			Keep=Keep[-c(1,2)]
			Keep2=c(Keep2,Keep)
			}

		hh1=unique(sapply(Keep2,strsplit," "))

		x1<-mapply(OnlyNumberElement,hh1,1)
		x2<-mapply(OnlyNumberElement,hh1,sapply(hh1,length))
	}else{
		x1=c()
		x2=c()
		for(i in 1:nrow(MeanDirectList)){
			x2Add=names(MeanDirectList)[which(abs(MeanDirectList[i,])>0)]
			x2<-c(x2,x2Add)
			x1<-c(x1,rep(names(MeanDirectList)[i],length(x2Add)))
			}
		}
	x=matrix(c(x1,rep("IND",length(x1)),x2),nrow=length(x2))
	x=unique(x)
	x=split(x,1:nrow(x))
	return(x)}

PathNames<-function(rowNum,InputInitializeMat){
		ColOnes=which(InputInitializeMat[rowNum,]==1)
		if(length(ColOnes)!=0){
			PName=names(InputInitializeMat)[ColOnes]
			PName=paste(PName,collapse=" ")
			PName=paste(row.names(InputInitializeMat)[rowNum],PName,sep=" ON ")
			PName=paste0(PName,";","\n")
		}else{
			PName=""
			}
		

		return(PName)
		}

WriteInitialInpFile<-function(AllData,InitialData,InputInitializeMat,IndList,Directry,NADes,WhichCat,WhichImpute,WhichRowsImp,AllMethods){
	
	#All data is in the format c(NameFile,DataFileName,ImputeSeed)
	NameFile=AllData[[1]]
	DataFileName=AllData[[2]]
	ImputeSeed=AllData[[3]]
	
	TO=Directry
	TO=paste(TO,"/",NameFile,sep="")
	dir.create(TO)
	
	N=names(InitialData)
	if(sum(WhichCat==1)!=0){
		IndepCount=apply(InputInitializeMat,1,sum)
		NC=N[WhichCat==1 & IndepCount>0]
	}else{
		NC=c()
	}

	Writer=c()
	Writer=paste("TITLE:","\n",sep="")
	Writer=paste(Writer,"DATA:","\n","FILE IS ",DataFileName,".dat;","\n",sep="")
	
	DataFileNameS=paste0(TO,"/",DataFileName,".dat")
	if(length(ImputeSeed)!=0){
		DatImputations(InitialData,ImputeSeed,NADes,DataFileNameS,WhichCat,WhichImpute,WhichRowsImp,AllMethods)
	}else{
		ID=seq(1,nrow(InitialData))
		InitialData=cbind(InitialData,ID)
		write.table(InitialData,DataFileNameS,sep="\t",row.names=FALSE,col.names=FALSE)
	}
		
	Writer=paste(Writer,"VARIABLE:","\n",sep="")
	Writer=paste(Writer,"NAMES ARE ",paste0(paste(N,collapse=" ")," IDvar"),";","\n",sep="")
	Writer=paste(Writer,"IDVARIABLE = IDvar;","\n",sep="")
	Writer=paste(Writer,"MISSING ARE ",paste(N,collapse=" "),"(",as.character(NADes[1]),")",";","\n",sep="")
	Writer=paste(Writer,"USEVARIABLES ARE ",paste(N,collapse=" "),";","\n",sep="")
	if(length(NC)!=0){
		Writer=paste(Writer,"CATEGORICAL ARE ",paste(NC,collapse=" "),";","\n",sep="")
		}
	Writer=paste(Writer,"ANALYSIS:","\n",sep="")
	Writer=paste(Writer,"ESTIMATOR = ","WLSMV",";","\n",sep="")
	Writer=paste(Writer,"PARAMETERIZATION = ","THETA",";","\n",sep="")
	Writer=paste(Writer,"MODEL=","NOCOVARIANCES",";","\n",sep="")
	Writer=paste(Writer,"MODEL:","\n",sep="")
	Writer2=paste(sapply(c(1:length(N)),PathNames,InputInitializeMat),sep="")
	Writer2=paste0(Writer2,collapse="")
	Writer=paste0(Writer,Writer2)
	Writer=paste0(Writer,"\n","MODEL INDIRECT:","\n","\n")
	Writer2=paste(sapply(IndList,paste,collapse=" ",sep=""),collapse=";\n")
	Writer=paste0(Writer,Writer2,";","\n")
	Writer=paste0(Writer,"SAVEDATA:","\n")
	Writer=paste0(Writer,"FILE IS ",paste0("MPlus",DataFileName,".txt"),";","\n")
	i=1
	NewFileName=paste(NameFile,"_",as.character(i),".INP",sep="")
	writeLines(Writer,paste0(TO,"/",NewFileName),sep="\n")
	return(Writer)}

Initialize<-function(InitialData,NumImpute=0,DataFileName="NewData",NameFile="New",Directry=getwd(),NADes=c(-99),
	startSeedImputations=1000,InputInitializeMat="N",WhichCat=rep(1,ncol(InitialData)),AllMethods=c("logreg","polr","pmm"),
	WhichImpute=rep(1,ncol(InitialData)),WhichRowsImp=c(1:nrow(InitialData)),PasteIND=1){

	Check=CheckVarNames(InitialData)
	if(Check=="CheckFailed"){
		return()}
	if(length(InputInitializeMat)==1){
		if(length(ncol(InputInitializeMat[1]))==0){
			if(InputInitializeMat=="N"){
				InputInitializeMat=CreateInitializeMatrix(InitialData,WhichCat)
				}
			}
		}
	for(i in 1:ncol(InitialData)){
		if(WhichCat[i]==0){
			if(sum(InputInitializeMat[i,])!=0){
				print("Continous Outcome Variables Not Permissible")
				print("InputInitializeMat has been modified accordingly")
				InputInitializeMat[i,]=rep(0,length(InputInitializeMat[i,]))
				}
			}
		}
	IndList=AddOnINDStatements(InputInitializeMat,PasteIND)	
	if(NumImpute!=0){
		NumImpList=seq(startSeedImputations,(startSeedImputations+NumImpute-1),1)
		NameFile=paste0(NameFile,"_")
		DataFileName=paste0(DataFileName,"_")
		AllData=ConvertData3(NameFile,DataFileName,NumImpList)
		WRt=lapply(AllData,WriteInitialInpFile,InitialData,InputInitializeMat,IndList,Directry,NADes,WhichCat,WhichImpute,WhichRowsImp,AllMethods)
		AllNames=sapply(AllData,OnlyNumberElement,1)
		AllDataNames=sapply(AllData,OnlyNumberElement,2)
	}else{
		NumImpList=c()
		AllData=c(list(NameFile),list(DataFileName),list(c()))
		WRt=WriteInitialInpFile(AllData,InitialData,InputInitializeMat,IndList,Directry,NADes,WhichCat,WhichImpute,WhichRowsImp,AllMethods)
		AllNames=NameFile
		AllDataNames=DataFileName
		}
	return(c(list("AllNames"=AllNames),list("AllDataNames"=AllDataNames)))}

#################################################################################################
#################################################################################################
#2nd Part Runs Backward Selection

NumEndFile<-function(NameoFile,pattern1,pattern2){
	LocUse=grep(NameoFile,pattern=pattern1)
	Loc=gregexpr(pattern =pattern2,NameoFile[LocUse])[[1]][1]
	num=substr(NameoFile[LocUse],1,(Loc-2))
	return(as.numeric(num))
	}
CreateSummaryMats<-function(FileName,OutputSE=FALSE,OutputPVal=FALSE,Directry,OutputFinalMat=TRUE){

	BeforeOnVar<-function(ONLines,DirectEffs){
		STARTbo=gregexpr("[A-Z]",DirectEffs[ONLines])[[1]][1][1]
		ENDbo=gregexpr("ON",DirectEffs[ONLines])[[1]][1][1]
		FirstWSpace=substr(DirectEffs[ONLines],STARTbo,(ENDbo-1))
		FirstSpaceLoc=gregexpr(" ",FirstWSpace)[[1]][1][1]
		varName=substr(FirstWSpace,1,(FirstSpaceLoc-1))
		return(varName)}

	AfterOnVars<-function(ONLineseq,ONLinesNew,EmptyLines,DirShort){
		VarsANDVals=DirShort[(ONLinesNew[ONLineseq]+1):(EmptyLines[ONLineseq]-1)]
		return(VarsANDVals)}

	TO=paste(Directry,"/",FileName,sep="")
	files <- list.files(path=TO,pattern = ".out$")
	
	hh=lapply(strsplit(files,"_"),NumEndFile,".out",'o')

	hh=as.numeric(paste(hh))
	LastFileName=files[which(hh==max(hh))]

	f=paste(readLines(paste(TO,"/",LastFileName,sep="")),collapse="\n")
	fs=strsplit(f,"\n")[[1]]
	StartDir=match("MODEL RESULTS",fs)
	EndDir=match("QUALITY OF NUMERICAL RESULTS",fs)
	DirectEffs=fs[StartDir:EndDir]
	ONLines=grep("ON",DirectEffs)

	BeforeOnVars=lapply(ONLines,BeforeOnVar,DirectEffs)

	LASTLine1=match("",DirectEffs[ONLines[length(ONLines)]:length(DirectEffs)])
	LASTLine=ONLines[length(ONLines)]+LASTLine1-1
	DirShort=DirectEffs[ONLines[1]:(LASTLine)]
	ONLinesNew=grep("ON",DirShort)
	EmptyLines=which(match(DirShort,"")==1)
	ONLineseq=seq(1,length(ONLinesNew))


	VarsANDVals=lapply(ONLineseq,AfterOnVars,ONLinesNew,EmptyLines,DirShort)

	EachIndDirSpc<-function(VarsANDVals){
		StartSpaces=lapply(VarsANDVals,gregexpr,pattern="  ")
		return(StartSpaces)}

	EachIndDirV<-function(VarsANDVals){
		StartVarLoc=lapply(VarsANDVals,gregexpr,pattern="[A-Z]")
		return(StartVarLoc)}

	StartVarsLoc=lapply(VarsANDVals,EachIndDirV)
	StartVarsLocS=lapply(VarsANDVals,EachIndDirSpc)
	INDLbig=c()
	INDLsmall=c()
	EFFbig=c()
	EFFsmall=c()
	for(i in 1:length(StartVarsLoc)){
		INDLsmall=c()
		EFFsmall=c()
		for(j in 1:length(StartVarsLoc[[i]])){
			st=as.numeric(StartVarsLoc[[i]][[j]][[1]])
			stp=as.numeric(StartVarsLocS[[i]][[j]][[1]])
			VAR=substr(VarsANDVals[[i]][j],st,(stp[which(stp>st[length(st)])][1]-1))
			AfterVarLoc=stp[which(stp>st[length(st)])][1]
		
			AllVarsVals=VarsANDVals[[i]][j]
			AllVals=substr(AllVarsVals,AfterVarLoc,nchar(AllVarsVals))
		
			ValsVec=strsplit(AllVals," ")[[1]]
			ValsVec=as.numeric(ValsVec[which(ValsVec!="")])
		
			NUMfirst=ValsVec[1]
			NUMSecond=ValsVec[2]
			NUMfourth=ValsVec[4]
		
			INDLsmall=c(INDLsmall,VAR)
			if(OutputSE==TRUE){
				EFFsmall=c(EFFsmall,NUMSecond)
				}
			if(OutputPVal==TRUE){
				EFFsmall=c(EFFsmall,NUMfourth)
				}
			if(OutputPVal==FALSE & OutputSE==FALSE){
				EFFsmall=c(EFFsmall,NUMfirst)
				}
		}
		INDLbig=c(INDLbig,list(INDLsmall))
		EFFbig=c(EFFbig,list(as.numeric(EFFsmall)))
		}

	USEVarsLoc=grep("USEVARIABLES ARE",fs)
	USEsp=strsplit(fs[USEVarsLoc]," ")[[1]]
	ARELoc=which(USEsp=="ARE")
	VARlist=USEsp[(ARELoc+1):length(USEsp)]
	SPACEQ=as.numeric(gregexpr(VARlist[length(VARlist)],pattern=" ")[[1]])
	if(SPACEQ>0){
		VARlist[length(VARlist)]=substr(VARlist[length(VARlist)],1,(SPACEQ-1))
		}
	SEMIQ=as.numeric(gregexpr(VARlist[length(VARlist)],pattern=";")[[1]])
	if(SEMIQ>0){
		VARlist[length(VARlist)]=substr(VARlist[length(VARlist)],1,(SEMIQ-1))
		}
	StoreMatEff=matrix(rep(0,length(VARlist)^2),nrow=length(VARlist))
	StoreMatEff=data.frame(StoreMatEff)
	names(StoreMatEff)=VARlist
	row.names(StoreMatEff)=VARlist

	for(i in 1:length(StartVarsLoc)){
		BeforeOnRow=which(row.names(StoreMatEff)==BeforeOnVars[[i]][1])
		for(j in 1:length(StartVarsLoc[[i]])){
			AfterOnRow=which(names(StoreMatEff)==INDLbig[[i]][j])
			StoreMatEff[BeforeOnRow,AfterOnRow]=EFFbig[[i]][j]
			}
		}
	if(OutputFinalMat==FALSE){
		return(c("Dependent"=list(c(unlist(BeforeOnVars))),"Independent"=list(INDLbig),"DirVals"=list(EFFbig)))}
	if(OutputFinalMat==TRUE){	
		write.table(StoreMatEff,file=paste(TO,"/results.csv",sep=""),sep=",")
		return(StoreMatEff)
		}
	}

ParseTotalEffects<-function(OutFile,FileName,Directry){
		#For Total Effects
		z1=which(match(OutFile,"Total")==1)[seq(1,length(which(match(OutFile,"Total")==1)),2)]
		z=(mapply(seq,z1-5,z1+10))
		AllNameTotTotIndList=OutFile[z[1:nrow(z),]]
		P1=seq(10,length(AllNameTotTotIndList),16)
		PT=as.numeric(AllNameTotTotIndList[P1])

		#use different lists for direct and total/indirect so you can delete indirect list but keep direct effects
		#For Direct Effects
		Summs<-CreateSummaryMats(FileName=FileName,OutputSE=FALSE,OutputPVal=TRUE,Directry=Directry,OutputFinalMat=FALSE)
		o=c()
		for(i in 1:length(Summs[[1]])){
			o=c(o,rep(Summs[[1]][i],length(Summs[[2]][[i]])))
		}
		M=matrix(c(o,unlist(Summs[[2]])),nrow=length(o))
		Mn=cbind(M[,2],rep("to",length(M[,2])),M[,1])
		Mn<-Mn
		P2=Mn
		PD=unlist(Summs[[3]])
		
		#Indirect Effects
		I1=seq(3,length(AllNameTotTotIndList),16)
		I2=rep(0,length(I1)*3)
		I2[which(mod(seq(1,length(I2)),3)==0)-0]=I1+2
		I2[which(mod(seq(1,length(I2)),3)==0)-1]=I1+1
		I2[which(mod(seq(1,length(I2)),3)==0)-2]=I1
		INDNameMat=matrix(AllNameTotTotIndList[I2],byrow=TRUE,ncol=3)
		PI1=seq(16,length(AllNameTotTotIndList),16)
		PTI=as.numeric(AllNameTotTotIndList[PI1])
	
		EntireF=c("TotalPVals"=list(PT),"INDPVals"=list(PTI),"INDNames"=list(INDNameMat),"DirectPVals"=list(PD),"DirectNames"=list(P2))
			
		return(EntireF)}

ParseTotalEffects2<-function(OutFile,StandardError=FALSE,PVal=FALSE,Indirect=FALSE){
	#For Total Effects
	z1=which(match(OutFile,"Total")==1)[seq(1,length(which(match(OutFile,"Total")==1)),2)]
	z=(mapply(seq,z1-5,z1+10))
	AllNameTotTotIndList=OutFile[z[1:nrow(z),]]
	if(Indirect==TRUE){
		P1=seq(13,length(AllNameTotTotIndList),16)
		if(StandardError==TRUE){
			P1=seq(14,length(AllNameTotTotIndList),16)
		}
		if(PVal==TRUE){
			P1=seq(16,length(AllNameTotTotIndList),16)
		}

	}else{
		P1=seq(7,length(AllNameTotTotIndList),16)
		if(StandardError==TRUE){
			P1=seq(8,length(AllNameTotTotIndList),16)
		}
		if(PVal==TRUE){
			P1=seq(10,length(AllNameTotTotIndList),16)
		}
	}
	PT=as.numeric(AllNameTotTotIndList[P1])
	
	#Indirect Effects
	I1=seq(3,length(AllNameTotTotIndList),16)
	I2=rep(0,length(I1)*3)
	I2[which(mod(seq(1,length(I2)),3)==0)-0]=I1+2
	I2[which(mod(seq(1,length(I2)),3)==0)-1]=I1+1
	I2[which(mod(seq(1,length(I2)),3)==0)-2]=I1
	INDNameMat=matrix(AllNameTotTotIndList[I2],byrow=TRUE,ncol=3)
	PI1=seq(16,length(AllNameTotTotIndList),16)
	PTI=as.numeric(AllNameTotTotIndList[PI1])
	
	EntireF=c("TotalVals"=list(PT),"TotalEffectNames"=list(INDNameMat))
	return(EntireF)}


MPlusBackwardSelect<-function(FileName,Directry,PSig){
	print(FileName)
	OriginalFileName=FileName
	Folder=paste(Directry,"/",FileName,"/",sep="")
	FileName=paste(FileName,"_",sep="")

	Rtrn1stElement<-function(lstStrings){
		return(lstStrings[1])}

	MAX<-function(ListNums,ERRORNum){
		ListNums2=(order(ListNums,decreasing=TRUE))
		RetV=ListNums[ListNums2[ERRORNum+1]]
		start=ERRORNum+1
		#FIX ERROR P-VALUE 1.00 WHEN NO INDIRECT EFFECT
		while(RetV>0.9999){
			start=start+1
			RetV=ListNums[ListNums2[start]]
		}
		return(RetV)}

	i=1
	y=paste(readLines(paste(Folder,FileName,as.character(i),".INP",sep="")),collapse="\n")
	ys=strsplit(y,"\n")[[1]]

	TotGreaterPSigYN=1
	ErrorCount=0
	while(TotGreaterPSigYN>0){
		
		runModels(Folder,logFile="MH_RunLog.txt",showOutput=FALSE,replaceOutfile="never")
		x=scan(paste(Folder,FileName,as.character(i),".out",sep=""),what=character())
		v1=paste(x,collapse=" ")
		ErrorQ=gregexpr("THE STANDARD ERRORS OF THE MODEL PARAMETER ESTIMATES COULD NOT BE COMPUTED",v1)[[1]][1]
		DirectDelete=0
		IndirectDelete=0
		if(ErrorQ>0){
			#Error handler that has remove next best p-value variable when error removing best
			ErrorCount=ErrorCount+1
			print("ERROR")
			print("THE STANDARD ERRORS OF THE MODEL PARAMETER ESTIMATES COULD NOT BE COMPUTED")
			files <- list.files(path=Folder,pattern = ".out$")
			hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2="o")
			hh=as.numeric(paste(hh))
			LastFileName=files[which(hh==max(hh))]
			file.remove(paste0(Folder,"/",LastFileName))
			OutLoc=gregexpr(pattern ='.out',LastFileName)[[1]][1]
			NewLast=paste(substr(LastFileName,1,OutLoc-1),".INP",sep="")
			file.remove(paste0(Folder,"/",NewLast))
			i=i-1
			if(i==0){
				print("THE INITIAL MODEL FAILED TO RUN IN MPLUS")
				print("TRY A DIFFERENT INITIALIZE MATRIX WITH POSSIBLE PREDICTOR COMBINATIONS")
				print("OR JUST TRY A DIFFERENT MODEL")
				return()
				}
			x=scan(paste(Folder,FileName,as.character(i),".out",sep=""),what=character())
		}else{
			ErrorCount=0
			}
		gg=ParseTotalEffects(x,OriginalFileName,Directry)
		M=MAX(gg[[1]],ErrorCount)
		if(M>=PSig){
			DesName=gg[[3]][which(gg[[1]]==M)[1],]
			print(DesName)
			IndirectDelete=1
			DirectDelete=1
		}
		if(M<PSig){
			M=MAX(gg[[2]],ErrorCount)
			if(M>=PSig){
				DesName=gg[[3]][which(gg[[2]]==M)[1],]
				print(DesName)
				IndirectDelete=1
				}
			if(M<PSig){
				M=MAX(gg[[4]],ErrorCount)
				if(M>=PSig){
					DesName=gg[[5]][which(gg[[4]]==M)[1],]
					print(DesName)
					DirectDelete=1
				}else{
					TotGreaterPSignYN=0
					break
 					}
				}
		}
		#in the case of a tie for p-value just use 1st one in matrix
		if(is.matrix(DesName)==TRUE){
			DesName=DesName[1,]
			}

		y=paste(readLines(paste(Folder,FileName,as.character(i),".INP",sep="")),collapse="\n")
		ys=strsplit(y,"\n")[[1]]

		Categorical=grep("CATEGORICAL",ys)
		StartModel=which(ys=="MODEL:")
		StartModelInd=which(ys=="MODEL INDIRECT:")
		DeletedSemi=0

		#For MODEL part
		WHOLE=ys[StartModel:StartModelInd]
		Spl=strsplit(WHOLE," ")
		Loc1st=which(as.numeric(mapply(match,DesName[[3]],Spl))==1)
		StrW1st=ys[StartModel:StartModelInd][Loc1st]
		Spl2nd=strsplit(StrW1st," ")[[1]]
		Loc2nd=which(match(Spl2nd,DesName[[1]])==1)
		if(length(Loc2nd)==0){
			Loc2nd=which(match(Spl2nd,paste0(DesName[[1]],";"))==1)
			DeletedSemi=1
			}
		SemiLoc=which(Spl2nd==";")
		SemiSpLoc=which(Spl2nd==" ;")
		Spl2ndNoSemi=Spl2nd
		if(length(SemiLoc!=0) | length(SemiSpLoc)!=0){
			if(length(SemiLoc!=0)){
				Spl2ndNoSemi=Spl2ndNoSemi[-SemiLoc]}
			if(length(SemiSpLoc!=0)){
				Spl2ndNoSemi=Spl2ndNoSemi[-SemiSpLoc]}
			}
	
		WHOLEnew=WHOLE	
		ChangeCat=0
		#this if clause in case only an IND effect and no Direct effect
		if(length(Loc2nd!=0) & DirectDelete==1){
			#print("DIRECT EFFECT DELETED")
			#if clause in case it is the only variable in relationship
			if(Loc2nd!=3 | (Loc2nd==3 & length(Spl2ndNoSemi)>3) ){
				Spl2ndNew=Spl2nd[-Loc2nd]
				if(DeletedSemi==1){
					Spl2ndNew=c(Spl2ndNew,";")
					}
				StrW1stNew=paste(Spl2ndNew,collapse=" ")
				WHOLEnew[Loc1st]=StrW1stNew
			}else{
				DeleteEntry=WHOLEnew[Loc1st]
				WHOLEnew=WHOLEnew[-Loc1st]
				#account for Categorical Statement
				CategoricalList=strsplit(ys[Categorical]," ")
				CategoricalListCl=CategoricalList[[1]][3:length(CategoricalList[[1]])]
				LastE=CategoricalListCl[length(CategoricalListCl)]
				if(substr(LastE,(nchar(LastE)),(nchar(LastE)))==";"){
					CategoricalListCl[length(CategoricalListCl)]=substr(LastE,1,(nchar(LastE)-1))
					}
				DeleteCat=which(is.na(match(CategoricalListCl,DesName[3]))==FALSE)
				if(length(DeleteCat)!=0){
					CategoricalListNewCl=CategoricalListCl
					CategoricalListNewCl=CategoricalListNewCl[-DeleteCat]
					LastE=CategoricalListNewCl[length(CategoricalListNewCl)]
					if(substr(LastE,(nchar(LastE)),(nchar(LastE)))!=";"){
						CategoricalListNewCl[length(CategoricalListNewCl)]=paste(LastE,";",sep="")
					}
					CategoricalListNew=paste(c("CATEGORICAL ARE",CategoricalListNewCl),collapse=" ")
					ChangeCat=1
					}
				}
			}
		#For MODEL INDIRECT PART note all indirect must follow var1 IND var2; format
			WHOLEInd=ys[StartModelInd:length(ys)]
			SplI=strsplit(WHOLEInd," ")
			if(length(mapply(match,DesName[[3]],SplI))!=0){
				LocI1st=which(as.numeric(mapply(match,DesName[[3]],SplI))==1)
				StrWI1st=WHOLEInd[LocI1st]
				SplI2nd=strsplit(StrWI1st," ")
				LocI2nd=as.numeric(which(mapply(match,sapply(SplI2nd,paste),paste0(DesName[[1]],";"))==1))/3
			
				WHOLEIndnew=WHOLEInd
				if(IndirectDelete==1){
					WHOLEIndnew=WHOLEIndnew[-(LocI1st[LocI2nd])]
					}
				if(DirectDelete==1 & IndirectDelete==0){
					ChckDelI=(ParseTotalEffects2(x,Indirect=TRUE)[[1]])[(LocI1st[LocI2nd])-2]
					#subtract 2 for blank space and Model Indirect statement
					if(ChckDelI==0){
						WHOLEIndnew=WHOLEIndnew[-(LocI1st[LocI2nd])]
						}
					}	
							
				AllWHOLEnew=c(ys[1:(StartModel-1)],WHOLEnew[1:(length(WHOLEnew)-1)],WHOLEIndnew)
			}else{
				WHOLEIndnew=WHOLEInd
				AllWHOLEnew=c(ys[1:(StartModel-1)],WHOLEnew[1:(length(WHOLEnew)-1)],WHOLEIndnew)
				}

		if(ChangeCat==1){
			AllWHOLEnew[9]=CategoricalListNew
			}
	
		WNEWScript=paste(AllWHOLEnew,collapse="\n")
		i=i+1
		writeLines(WNEWScript,paste(Folder,FileName,as.character(i),".INP",sep=""))
		}
	}

AllBackwardSelect<-function(AllNames,Directry=getwd(),PSig=0.05){
	lapply(sapply(AllNames,list),MPlusBackwardSelect,Directry,PSig)
	return()}

#################################################################################################
#################################################################################################
#Note must use capital letters for variable names**********
#The 3rd Part summarizes final output files for analysis

CountImputedEffect<-function(LL,LLse,LLPVal,GreaterThanNum){
#GreaterThanNum is the number of times over which a variable relationship should be seen in order to be used in overall mean results, 
#default is more than 0 times

	Great0<-function(xx){
		zz=matrix(as.numeric(abs(xx)>0.001),nrow=nrow(xx))
		return(zz)}

	LLL=lapply(LL,Great0)
	BigLLL=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	BigLLm=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	BigLLmse=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	BigLLmeanPval=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	PValMinMat=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	PValMaxMat=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))
	PValMedianMat=matrix(rep(0,length(LLL[[1]])),nrow=nrow(LLL[[1]]))


	for(i in 1:length(LLL)){
		BigLLL=BigLLL+LLL[[i]]
		BigLLm=BigLLm+LL[[i]]
		BigLLmse=BigLLmse+LLse[[i]]
		BigLLmeanPval=BigLLmeanPval+LLPVal[[i]]
	}

	for(i in 1:nrow(BigLLL)){
		for(j in 1:ncol(BigLLL)){
			if(BigLLL[i,j]>GreaterThanNum){
				BigLLm[i,j]=BigLLm[i,j]/BigLLL[i,j]
				BigLLmse[i,j]=BigLLmse[i,j]/BigLLL[i,j]
				BigLLmeanPval[i,j]=BigLLmeanPval[i,j]/BigLLL[i,j]
			}else{
				BigLLm[i,j]=0
				BigLLmse[i,j]=0
				BigLLmeanPval[i,j]=0
			}
		}
		}
	
	for(j in 1:nrow(BigLLL)){
		for(k in 1:ncol(BigLLL)){
			PValVec=c()
			Include=c()
			for(i in 1:length(LLL)){
				PValVec=c(PValVec,LLPVal[[i]][j,k])
				Include=c(Include,LLL[[i]][j,k])
				}
			if(length(which(Include==1))>GreaterThanNum){
				PValMinMat[j,k]=min(PValVec[which(Include==1)])
				PValMaxMat[j,k]=max(PValVec[which(Include==1)])
				PValMedianMat[j,k]=median(PValVec[which(Include==1)])
				}
			}	
		}

	BigLLL=data.frame(BigLLL)
	BigLLm=data.frame(BigLLm)
	BigLLmse=data.frame(BigLLmse)
	BigLLmeanPval=data.frame(BigLLmeanPval)
	PValMinMat=data.frame(PValMinMat)
	PValMaxMat=data.frame(PValMaxMat)
	PValMedianMat=data.frame(PValMedianMat)

	row.names(BigLLL)=row.names(LL[[1]])
	row.names(BigLLm)=row.names(LL[[1]])
	row.names(BigLLmse)=row.names(LL[[1]])
	row.names(PValMinMat)=row.names(LL[[1]])
	row.names(PValMaxMat)=row.names(LL[[1]])
	row.names(PValMedianMat)=row.names(LL[[1]])
	row.names(BigLLmeanPval)=row.names(LL[[1]])
	
	names(BigLLL)=names(LL[[1]])
	names(BigLLm)=names(LL[[1]])
	names(BigLLmse)=names(LL[[1]])
	names(PValMinMat)=names(LL[[1]])
	names(PValMaxMat)=names(LL[[1]])
	names(PValMedianMat)=names(LL[[1]])
	names(BigLLmeanPval)=names(LL[[1]])

	return(c(list("DirectEffectCounts"=BigLLL),list("MeanDirectEffects"=BigLLm),list("MeanStandardError"=BigLLmse),list("MeanPValue"=BigLLmeanPval),list("MinPVals"=PValMinMat),list("MaxPVals"=PValMaxMat),list("MedianPVals"=PValMedianMat)))}


AllSummary2<-function(AllNames,Directry=getwd(),GreaterThanNum=0){
	LL1=lapply(AllNames,CreateSummaryMats,OutputSE=FALSE,OutputPVal=FALSE,Directry=Directry,OutputFinalMat=TRUE)
	LL1se=lapply(AllNames,CreateSummaryMats,OutputSE=TRUE,OutputPVal=FALSE,Directry=Directry,OutputFinalMat=TRUE)
	LL1p=lapply(AllNames,CreateSummaryMats,OutputSE=FALSE,OutputPVal=TRUE,Directry=Directry,OutputFinalMat=TRUE)

	LLL=CountImputedEffect(LL1,LL1se,LL1p,GreaterThanNum)
	LLL1=LLL[[1]]
	LLm1=LLL[[2]]
	LLse1=LLL[[3]]
	LLmeanP1=LLL[[4]]
	LLminP1=LLL[[5]]
	LLmaxP1=LLL[[6]]
	LLmedP1=LLL[[7]]

	return(c(list("DirectEffects"=LL1),list("Average"=LLL)))}

#################################################################################################
###################################################################################################
#Part 4 is Add-Ons
#1st Add-On is recursive function to read final direct effect output summary and create new inp and then output
#of all possible Indirect and Total Effects, useful with PasteIND=0 option in Initialize

AllSummary<-function(AllNames,Directry=getwd(),GreaterThanNum=0,PasteIND=1){
	yyy=AllSummary2(AllNames)
	IndStatements=lapply(yyy[[1]],AddOnINDStatements,PasteIND)
	return(c(list("Average"=yyy[[2]]),list("INDStatements"=IndStatements)))}

#######################################################################
#######################################################################
#2nd Part 4 adds the last add on to input file and runs it

CreateSummaryMats2<-function(AllDat,Directry){
	
	FileName=AllDat[[1]]
	jj=AllDat[[2]]
	
	TO=paste(Directry,"/",FileName,sep="")
	print(TO)
	files <- list.files(path=TO,pattern = ".INP$")
	
	hh=lapply(strsplit(files,"_"),NumEndFile,".INP",'INP')
	
	hh=as.numeric(paste(hh))
	LastFileName=files[which(hh==max(hh))]
	
	NewFNum=max(hh)+1

	y=paste(readLines(paste(TO,"/",LastFileName,sep="")),collapse="\n")
	ys=strsplit(y,"\n")[[1]]
	
	StartModelInd=which(ys=="MODEL INDIRECT:")
	Ys2=ys
	Ys2=Ys2[1:StartModelInd]

	jj=unlist(jj)
	jj[mod(c(1:length(jj)),3)==2]=paste0(" ",substr(jj[mod(c(1:length(jj)),3)==2],1,nchar(jj[mod(c(1:length(jj)),3)==2]))," ")
	newjj=rep(0,length(jj)/3+length(jj))
	newjj[mod(c(1:length(newjj)),4)==0]="\n"
	newjj[mod(c(1:length(newjj)),4)!=0]=jj
	newjj[mod(c(1:length(newjj)),4)==3]=paste0(substr(newjj[mod(c(1:length(newjj)),4)==3],1,nchar(newjj[mod(c(1:length(newjj)),4)==3])),";")
	newjj=c("\n",newjj)
	newjj=paste(newjj,collapse="")
	
	UU=gregexpr(pattern ='_',LastFileName)[[1]]
	UscoreLast=UU[length(UU)]
	INPLoc=gregexpr(pattern ='.INP',LastFileName)[[1]][1]
	NewLast=LastFileName
	NewLast=paste(substr(NewLast,1,UscoreLast),NewFNum,substr(NewLast,INPLoc,nchar(NewLast)),sep="")
	
	WNEWScript=paste(Ys2,collapse="\n")
	WNEWScript=paste(WNEWScript,newjj,sep="")
	check=strsplit(WNEWScript,"\n")[[1]]
	writeLines(WNEWScript,paste(TO,"/",NewLast,sep=""))

	runModels(TO,logFile="MH_RunLog.txt",showOutput=FALSE,replaceOutfile="never")
	return(NewLast)
	}

AddOnAllInd<-function(FileName,IndStatements,Directry=getwd()){
	
	ConvertData<-function(List1,jjlist1){
		NewList=c()
		for(i in 1:length(List1)){
			NewList=c(NewList,list(c(list(List1[[i]]),list(jjlist1[[i]]))))
			}
		return(NewList)}

	AllDat1=ConvertData(FileName,IndStatements)
	qq1=lapply(AllDat1,CreateSummaryMats2,Directry)
	return()}


###############################################################################################################################################
###############################################################################################################################################
#Part 5 Calculates Risk Ratios

NewBinseqWrap<-function(n,PossibleCoefs){

	NewBinseq<-function(n,v=c(),PossibleCoefs){
		if(n==0){
			cat(v,"\n")
			return()
		} else {
			for(i in 1:length(PossibleCoefs[[n]])){
				NewBinseq(n-1,v=c(v,PossibleCoefs[[n]][i]),PossibleCoefs)
				}
			}	
		}
	L=capture.output(NewBinseq(n,v=c(),PossibleCoefs))
	L=strsplit(L," ")
	L=lapply(L,as.numeric)
	return(L)}


SpecialMatch<-function(ListO,DelL){
	for(i in 1:length(ListO)){
		ListO[[i]]=ListO[[i]][is.na(DelL[[i]])==TRUE]
		}
	return(ListO)}

CalculatRiskRatios<-function(AllDat,NADes,Directry=getwd(),WhichCat,WhichRiskCalc){
	#WhichRiskCalc is a vector same length as WhichCat which specifies the value used for each variable in risk ratio calculations
	#if value is zero then the default is used which is all possible values for categorical (separate risk ratio for each and compared to zero)
	#and average of all continuous values for continuous variable compared to zero with 
	#user can specify another value or a list of values for each variable if a list rather than one value is used then averaging over these values is performed
	#and a risk ratio is given for each value

	LastFileOut=AllDat[[1]]
	print(LastFileOut)
	TO=paste(Directry,"/",LastFileOut,sep="")

	files <- list.files(path=TO,pattern = ".out$")

	hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2='out')
	hh=as.numeric(paste(hh))
	LastFileName=files[which(hh==max(hh))]

	x=AllDat[[3]]
	y=paste(readLines(paste(TO,"/",LastFileName,sep="")),collapse="\n")

	NonZeroIndDep<-function(MatchNZ,DirEffMat){
		IndIces=which(abs(DirEffMat[MatchNZ,])>0.01)
		return(IndIces)}

	NonZeroIndDepVals<-function(MatchNZ,DirEffMat){
		Vals=DirEffMat[MatchNZ,][which(abs(DirEffMat[MatchNZ,])>0.01)]
		return(Vals)}

	NewNames<-function(NumDep,x){
		RetV=names(x)[NumDep]
		return(RetV)}

	SpecialAppend<-function(ListO,posFixOne,AppendVal){
		ListwO=append(ListO,c(),posFixOne)
		return(ListwO)}

	SpecialMult<-function(x,z){
		q=sum(x*z)
		return(q)}
	DeleteElement<-function(ListO,List1){
		if(length(which(ListO==1))!=0){
			List1=List1[-which(ListO==1)]
		}else{
			List1=List1}
		return(List1)}

	SpecialDiv<-function(ListO){
		RetV=(ListO[1:(length(ListO)-1)])/(ListO[length(ListO)])
	return(RetV)}

	DatName=paste0(TO,"/",AllDat[[2]],".DAT")
	FROMFile=DatName

	print(FROMFile)
	rd=read.table(FROMFile,sep="\t",header=FALSE)
	#account for id variables
	rd=rd[,-ncol(rd)]
	
	WDum=lapply(sapply(seq(1,ncol(rd)),list),NumCat,rd,NADes)

	WDum=as.numeric(paste(WDum))

	ys=strsplit(y,"\n")[[1]]

	NAMESLoc=grep("NAMES ARE",ys)
	NAMES=ys[NAMESLoc]
	Nvec=strsplit(NAMES," ")[[1]]
	if(substr(Nvec[length(Nvec)],nchar(Nvec[length(Nvec)]),nchar(Nvec[length(Nvec)]))==";"){
		Nvec[length(Nvec)]=substr(Nvec[length(Nvec)],1,nchar(Nvec[length(Nvec)])-1)
		}
	Nvec=Nvec[(which(Nvec=="ARE")+1):length(Nvec)]

	ThreshLoc=grep("Thresholds",ys)
	EndThresh=which(ys[ThreshLoc:length(ys)]=="")[1]+ThreshLoc-1
	Thresh=ys[(ThreshLoc+1):(EndThresh-1)]

	AllThresh=sapply(Thresh,strsplit," ")
	DL=lapply(AllThresh,match,"")
	AllThreshNoSp=SpecialMatch(AllThresh,DL)
	ThreshMat=matrix(unlist(AllThreshNoSp),nrow=5)
	ThresholdVals=as.numeric(ThreshMat[2,])
	ThresholdNames=ThreshMat[1,]

	MatchThresh=(sapply(names(x),grep,ThresholdNames))
	REM=which(sapply(MatchThresh,length)==0)
	if(length(REM)!=0){
		MatchThreshKeep=MatchThresh[-REM]
	}else{
		MatchThreshKeep=MatchThresh
		}

	MatchMatNZ=sapply(names(MatchThreshKeep),grep,row.names(x))
	NumDep=sapply(MatchMatNZ,NonZeroIndDep,x)
	InDepNames=sapply(NumDep,NewNames,x)
	DepVals=sapply(MatchMatNZ,NonZeroIndDepVals,x)

	QL=c()

	StoreRR=c()
	NAMErr=c()
	RRMat=x

	for(i in 1:length(NumDep)){
		NumDums=WDum[which(is.na(match(Nvec,InDepNames[[i]]))==FALSE)]
		MTCHnum=which(is.na(match(Nvec,InDepNames[[i]]))==FALSE)
		
		if(length(MTCHnum)>1){
			PossibleCo=apply(rd[,MTCHnum],2,unique)
		}else{
			PossibleCo=list(unique(rd[,MTCHnum]))
			}
		if(is.matrix(PossibleCo)==TRUE){
			PossibleCo=lapply(apply(PossibleCo,2,list),OnlyNumberElement,1)
			}

		PossibleCo=mapply(DeleteElement,lapply(PossibleCo,match,NADes),PossibleCo)
		if(is.matrix(PossibleCo)==TRUE){
			PossibleCo=lapply(apply(PossibleCo,2,list),OnlyNumberElement,1)
			}

		PossibleCo1=c()
		for(p in 1:length(MTCHnum)){
			if(length(WhichRiskCalc[[MTCHnum[p]]])==1){
				if(WhichRiskCalc[[MTCHnum[p]]]==0 & WhichCat[[MTCHnum[p]]]==1){
					PossibleCo1=c(PossibleCo1,list(PossibleCo[[p]]))
				}
				if(WhichRiskCalc[[MTCHnum[p]]]==0 & WhichCat[[MTCHnum[p]]]==0){
					L1=DeleteElement(match((rd[,MTCHnum[p]]),NADes),(rd[,MTCHnum[p]]))
 					PossibleCo1=c(PossibleCo1,list(c(0,mean(L1))))
				}
			}
			if(length(WhichRiskCalc[[MTCHnum[p]]])!=1){
				PossibleCo1=c(PossibleCo1,list(WhichRiskCalc[[MTCHnum[p]]]))
				}
			if(length(WhichRiskCalc[[MTCHnum[p]]])==1){
				if(WhichRiskCalc[[MTCHnum[p]]]!=0){
					PossibleCo1=c(PossibleCo1,list(WhichRiskCalc[[MTCHnum[p]]]))
				}
			}
		}
		PossibleCo=PossibleCo1
		PossibleCoC=PossibleCo
		PivotVarNum=length(NumDep[[i]])
		UseDpVls=(as.numeric(DepVals[[i]]))
		h=c(1:length(InDepNames[[i]]))
		for(j in 1:length(NumDep[[i]])){
			n=length(NumDep[[i]])

			PossibleCo=PossibleCoC
			PossibleCo=rev(PossibleCo)
		
			PossibleCoC=c(list(PossibleCoC[[length(PossibleCoC)]]),PossibleCoC)
			PossibleCoC=PossibleCoC[-length(PossibleCoC)]

			V=NewBinseqWrap(n=n,PossibleCoefs=PossibleCo)
			RR=c()
			Vnew0=sapply(V,SpecialAppend,j,0)
			
			if(is.matrix(Vnew0)==FALSE){
				Vnew0=matrix(Vnew0,nrow=1)
				}
			AllPivUn=unique(Vnew0[1,])
			AllPivUn=sort(AllPivUn)
			StoreProd=c()
			for(k in 1:length(AllPivUn)){
				Selected=Vnew0[,which(Vnew0[1,]==AllPivUn[k])]
				if(is.matrix(Selected)==FALSE){
					Selected=matrix(Selected,nrow=1)
					}
				StoreProd1MT=apply(Selected,2,SpecialMult,UseDpVls)
				StoreProd=c(StoreProd,list(StoreProd1MT))
				}
		
			UseDpVlsFrontStore=UseDpVls[length(UseDpVls)]
			UseDpVls=UseDpVls[-length(UseDpVls)]
			UseDpVls=c(UseDpVlsFrontStore,UseDpVls)
						
			PivotVarNum=PivotVarNum-1

			StoreWThreshF=c()
			StoreWThreshSubtr=c()
			for(m in length(ThresholdVals[MatchThreshKeep[[i]]]):1){
				if(m==length(ThresholdVals[MatchThreshKeep[[i]]])){
					StoreWThresh1=lapply(StoreProd,"+",-1*ThresholdVals[MatchThreshKeep[[i]]][m])
					StoreWThreshF1=lapply(StoreWThresh1,pnorm)
					StoreWThreshF1=matrix(unlist(StoreWThreshF1),nrow=length(StoreWThreshF1),byrow=TRUE)
					StoreWThreshSubtr1=StoreWThreshF1
					RRatioA=apply(StoreWThreshSubtr1,1,mean)
					}
				if(m<length(ThresholdVals[MatchThreshKeep[[i]]])){
					StoreWThresh1=lapply(StoreProd,"+",-1*ThresholdVals[MatchThreshKeep[[i]]][m])
					StoreWThresh2=lapply(StoreProd,"+",-1*ThresholdVals[MatchThreshKeep[[i]]][m+1])
					StoreWThreshF1=lapply(StoreWThresh1,pnorm)
					StoreWThreshF2=lapply(StoreWThresh2,pnorm)
					StoreWThreshF1=1-matrix(unlist(StoreWThreshF1),nrow=length(StoreWThreshF1),byrow=TRUE)
					StoreWThreshF2=1-matrix(unlist(StoreWThreshF2),nrow=length(StoreWThreshF2),byrow=TRUE)
					StoreWThreshSubtr1=StoreWThreshF2-StoreWThreshF1
					RRatioA=apply(StoreWThreshSubtr1,1,mean)
					}
				RRatioNew=c()
				for(b in 1:(length(RRatioA)-1)){
					RRatioNew=c(RRatioNew,RRatioA[b+1]/RRatioA[1])
					}
				RRatioA=RRatioNew
				StoreRR=c(StoreRR,list(RRatioA))
				NAMErr=c(NAMErr,list(paste(ThresholdNames[MatchThreshKeep[[i]][m]],InDepNames[[i]][h[1]])))
				}
			h=c(h[length(h)],h)
			h=h[-length(h)]
			}
		}
	names(StoreRR)=NAMErr
	AllNames<-strsplit(names(StoreRR)," ")
	AllThresh<-unique(unlist(AllNames)[mod(seq(1,length(unlist(AllNames))),2)==1])
	AllInDep<-unique(unlist(AllNames)[mod(seq(1,length(unlist(AllNames))),2)==0])
	M<-match(AllInDep,Nvec)
	
	Mdefault=which(is.na(match(WhichRiskCalc,0))==FALSE)
 	Mloc=match(M,Mdefault)
	Mloc2=which(is.na(Mloc)==TRUE)
	AddM=M[Mloc2]
	
	MM<-c()
	if(length(AddM)!=0){
		for(u in 1:length(M)){
			if(is.na(match(M[u],AddM))==FALSE){
				MM=c(MM,length(WhichRiskCalc[[M[u]]])-1)
			}else{
				if(WhichCat[M[u]]==1){
					MM=c(MM,WDum[M[u]]-1)
					}
				if(WhichCat[M[u]]==0){
					MM=c(MM,1)
					}
				}
			}
		MMM<-AllInDep[which(MM>1)]
	}else{
		MM<-WDum[M]-1
		MMM<-AllInDep[which(MM>1)]
		}
	AFTERadd=0
	AllInDep3=AllInDep
	AllInDep2=AllInDep
	if(length(MMM)!=0){
		for(p in 1:length(MMM)){
			
			Index1=M[which(MM>1)][p]
			L=rep(MMM[p],MM[which(MM>1)][p]-1)
			if(length(WhichRiskCalc[[Index1]])!=1){
				L1=WhichRiskCalc[[Index1]][2:length(WhichRiskCalc[[Index1]])]
				L2=lapply(unique(L),paste0,L1)[[1]]
				AllInDep3=append(AllInDep3,L,after=which(MM>1)[p]+AFTERadd)
				AllInDep2=append(AllInDep2,L2,after=which(MM>1)[p]+AFTERadd)
				AllInDep2=AllInDep2[-(which(MM>1)[p]+AFTERadd)]
				AFTERadd=AFTERadd+MM[which(MM>1)][p]-1
				}
			if(length(WhichRiskCalc[[Index1]])==1){
				if(WhichRiskCalc[[Index1]]!=0){
					print("Error:You need to specify atleast two values for a risk ratio to be calculated")
					return()
					}
				if(WhichRiskCalc[[Index1]]==0){
					if(WhichCat[[Index1]]==0){
						L1=DeleteElement(match((rd[,Index1]),NADes),(rd[,Index1]))
						L1=c(mean(L1))
						L2=lapply(unique(L),paste0,L1)[[1]]
						AllInDep2=append(AllInDep2,L2,after=which(MM>1)[p]+AFTERadd)
						AllInDep2=AllInDep2[-(which(MM>1)[p]+AFTERadd)]

					}else{
						L1=DeleteElement(match(unique(rd[,Index1]),NADes),unique(rd[,Index1]))
						L1=sort(L1)[2:length(L1)]
						L2=lapply(unique(L),paste0,L1)[[1]]
						AllInDep3=append(AllInDep3,L,after=which(MM>1)[p]+AFTERadd)
						AllInDep2=append(AllInDep2,L2,after=which(MM>1)[p]+AFTERadd)
						AllInDep2=AllInDep2[-(which(MM>1)[p]+AFTERadd)]
						AFTERadd=AFTERadd+MM[which(MM>1)][p]-1
						}
					}
				}
			}
		}
	AllInDep=AllInDep2
	RRresults=matrix(rep(0,length(AllThresh)*length(AllInDep)),nrow=length(AllThresh))
	RRresults=data.frame(RRresults)
	row.names(RRresults)=AllThresh
	names(RRresults)=AllInDep
	for(p in 1:length(StoreRR)){
		FND=AllNames[[p]]
		row=which(row.names(RRresults)==FND[1])
		col=which(AllInDep3==FND[2])
		for(t in 1:length(col)){
			RRresults[row,col[t]]=as.numeric(StoreRR[[p]][t])
			}
		}
	return(RRresults)
	}

ConvertData2<-function(List1,List2,jjlist1){
	NewList=c()
	for(i in 1:length(List1)){
		NewList=c(NewList,list(c("Name"=list(List1[[i]]),"DataName"=list(List2[[i]]),"DirectEffect"=list(jjlist1[[i]]))))
		}
	return(NewList)
	}

AverageRRs<-function(ListORatioMats,GreaterThanCountNum){
		
	MakeThreshList<-function(ThreshL,RowYN){
		if(RowYN==0){
			RetV=names(ThreshL)

		}else{
			RetV=row.names(ThreshL)
		}
	return(RetV)}

	AllThreshNames<-unique(unlist(lapply(ListORatioMats,MakeThreshList,1)))
	AllIndNames<-unique(unlist(lapply(ListORatioMats,MakeThreshList,0)))
	OldInd=AllIndNames
	AccountCat=as.numeric(sapply(sapply(AllIndNames,grep,AllThreshNames),length))
	AccountG1Ind=which(AccountCat>1)
	AFTER=0
	if(length(AccountG1Ind)!=0){
	for(i in 1:length(AccountG1Ind)){
		for(j in 2:AccountCat[AccountG1Ind]){
			AFTER=AFTER+(AccountG1Ind[i])
			AllIndNames=append(AllIndNames,values=OldInd[AccountG1Ind[i]],after=AFTER)
			AFTER=AFTER+1
			}
		}
	}
	TotalColNum=length(AccountCat)+sum(AccountCat[AccountCat>0]-1)
	
	AllRatioMat=matrix(rep(0,length(AllThreshNames)*length(AllIndNames)),nrow=length(AllThreshNames))
	AllCountMat=matrix(rep(0,length(AllThreshNames)*length(AllIndNames)),nrow=length(AllThreshNames))

	for(i in 1:length(ListORatioMats)){
		N=names(ListORatioMats[[i]])
		RN=row.names(ListORatioMats[[i]])
		for(j in 1:nrow(ListORatioMats[[i]])){
			Row=which(AllThreshNames==RN[j])
			k=1
			while(k<=ncol(ListORatioMats[[i]])){
				Col=which(AllIndNames==N[k])
				for(l in 1:length(Col)){
					AllRatioMat[Row,(Col[l])]=AllRatioMat[Row,(Col[l])]+ListORatioMats[[i]][j,k]
					if(abs(ListORatioMats[[i]][j,k])>0){
						AllCountMat[Row,(Col[l])]=AllCountMat[Row,(Col[l])]+1
						}
					k=k+1
					}
				}
			}
		}
	AllRatioMat=((AllRatioMat)/(AllCountMat+.0000000000001))
	GreaterThan=AllCountMat>GreaterThanCountNum
	AllRatioMat=AllRatioMat*GreaterThan
	AllRatioMat=data.frame(AllRatioMat)
	names(AllRatioMat)=AllIndNames
	row.names(AllRatioMat)=AllThreshNames
	return(c("AverageRiskRatios"=list(AllRatioMat),"CountInAverage"=list(AllCountMat)))
	}





##########################################################################################
#########################################################################################
#Part 5 add-on 1 is total effects and depends on some values form part 5

TotalRiskRatios<-function(AllDat,Directry=getwd(),InputDepVal=1){

	AssignMatFun<-function(AllDat,InputDepVal){
		LastFileOut=AllDat[[1]]
		print(LastFileOut)
		TO=paste(Directry,"/",LastFileOut,sep="")
		print(TO)
		files <- list.files(path=TO,pattern = ".out$")
	
		hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2='out')
		hh=as.numeric(paste(hh))
		LastFileName=files[which(hh==max(hh))]

		print(LastFileName)
		x=scan(paste(TO,"/",LastFileName,sep=""),what=character())

		GG<-ParseTotalEffects2(x)
		
		RNAMES<-unique(GG[[2]][,3])
		CNAMES<-unique(GG[[2]][,1])

		MRname<-match(GG[[2]][,3],RNAMES)
		LMRname<-as.numeric(sapply(split(MRname,MRname),length))
		
		y=paste(readLines(paste(TO,"/",LastFileName,sep="")),collapse="\n")	

		ys=strsplit(y,"\n")[[1]]
		ThreshLoc=grep("Thresholds",ys)
		EndThresh=which(ys[ThreshLoc:length(ys)]=="")[1]+ThreshLoc-1
		Thresh=ys[(ThreshLoc+1):(EndThresh-1)]

		AllThresh=sapply(Thresh,strsplit," ")
		DL=lapply(AllThresh,match,"")
		AllThreshNoSp=SpecialMatch(AllThresh,DL)
		ThreshMat=matrix(unlist(AllThreshNoSp),nrow=5)
		ThresholdVals<-as.numeric(ThreshMat[2,])
		ThresholdNames<-ThreshMat[1,]

		MatchThresh<-(lapply(RNAMES,grep,ThresholdNames))
		REM<-which(sapply(MatchThresh,length)==0)
		if(length(REM)!=0){
			MatchThreshKeep<-MatchThresh[-REM]
		}else{
			MatchThreshKeep<-MatchThresh
			}
		NAMErr=c()
		StoreRR=c()
		LMRcount=0

		for(i in 1:length(MatchThreshKeep)){
			for(k in 1:LMRname[i]){
				LMRcount=LMRcount+1
				TotEffVal=GG[[1]][LMRcount]
				if(abs(TotEffVal)>0.001){
					for(m in length(ThresholdVals[MatchThreshKeep[[i]]]):1){
						if(m==length(ThresholdVals[MatchThreshKeep[[i]]])){
							StoreWThresh1=-ThresholdVals[MatchThreshKeep[[i]][m]]+TotEffVal*InputDepVal
							StoreWThreshF1=pnorm(StoreWThresh1)
							StoreWThreshSubtr1=StoreWThreshF1
							RRatio=StoreWThreshSubtr1/(pnorm(-ThresholdVals[MatchThreshKeep[[i]][m]]))
							if(is.matrix(RRatio)==FALSE){
								RRatio=matrix(RRatio,nrow=1)
								}
							}
						if(m<length(ThresholdVals[MatchThreshKeep[[i]]])){
							StoreWThresh1=ThresholdVals[MatchThreshKeep[[i]][m]]-TotEffVal*InputDepVal
							StoreWThresh2=ThresholdVals[MatchThreshKeep[[i]][m+1]]-TotEffVal*InputDepVal
							StoreWThreshF1=pnorm(StoreWThresh1)
							StoreWThreshF2=pnorm(StoreWThresh2)
							StoreWThreshSubtr1=StoreWThreshF2-StoreWThreshF1
							RRatio=StoreWThreshSubtr1/(pnorm(ThresholdVals[MatchThreshKeep[[i]][m+1]])-pnorm(ThresholdVals[MatchThreshKeep[[i]][m]]))
							if(is.matrix(RRatio)==FALSE){
								RRatio=matrix(RRatio,nrow=1)
								}
							}
						StoreRR=c(StoreRR,list(RRatio))
						NAMErr=c(NAMErr,list(paste(ThresholdNames[MatchThreshKeep[[i]]][m],GG[[2]][,1][LMRcount])))
					}
				}
			}
		}
		names(StoreRR)=NAMErr
		AllNames=strsplit(names(StoreRR)," ")
		AllThresh=unique(unlist(AllNames)[mod(seq(1,length(unlist(AllNames))),2)==1])
		AllInDep=unique(unlist(AllNames)[mod(seq(1,length(unlist(AllNames))),2)==0])
		RRresults=matrix(rep(0,length(AllThresh)*length(AllInDep)),nrow=length(AllThresh))
		RRresults=data.frame(RRresults)
		row.names(RRresults)=AllThresh
		names(RRresults)=AllInDep
		for(p in 1:length(StoreRR)){
			FND=AllNames[[p]]
			row=which(row.names(RRresults)==FND[1])
			col=which(names(RRresults)==FND[2])
			for(t in 1:length(col)){
				RRresults[row,col[t]]=StoreRR[[p]][t]
				}
			}
		return(RRresults)}
	
	RRresults=AssignMatFun(AllDat,InputDepVal)
	return(RRresults)}

###################################################################
####################################################################
#Add-On Total Effects actual effects not risk ratios

CreateTotalEffMat<-function(FileName,Directry){
	LastFileOut=FileName
	print(LastFileOut)
	TO=paste0(Directry,"/",LastFileOut)
	files <- list.files(path=TO,pattern = ".out$")
	
	hh=lapply(strsplit(files,"_"),NumEndFile,pattern1=".out",pattern2="out")
	hh=as.numeric(paste(hh))
	LastFileName=files[which(hh==max(hh))]

	print(LastFileName)
	x=scan(paste(TO,"/",LastFileName,sep=""),what=character())

	GG=ParseTotalEffects2(x,PVal=FALSE)
	GGp=ParseTotalEffects2(x,PVal=TRUE)
	GGse=ParseTotalEffects2(x,StandardError=TRUE)

	y=paste(readLines(paste(TO,"/",LastFileName,sep="")),collapse="\n")
	ys=strsplit(y,"\n")[[1]]
		
	NAMESLoc=grep("USEVARIABLES ARE",ys)
	NAMES=ys[NAMESLoc]
	Nvec=strsplit(NAMES," ")[[1]]
	if(substr(Nvec[length(Nvec)],nchar(Nvec[length(Nvec)]),nchar(Nvec[length(Nvec)]))==";"){
		Nvec[length(Nvec)]=substr(Nvec[length(Nvec)],1,nchar(Nvec[length(Nvec)])-1)
		}
	Nvec=Nvec[(which(Nvec=="ARE")+1):length(Nvec)]
	
	TotalEffMat=matrix(rep(0,length(Nvec)*length(Nvec)),nrow=length(Nvec))
	TotalEffMat=data.frame(TotalEffMat)
	names(TotalEffMat)=Nvec
	row.names(TotalEffMat)=Nvec

	TotalPValMat=matrix(rep(0,length(Nvec)*length(Nvec)),nrow=length(Nvec))
	TotalPValMat=data.frame(TotalPValMat)
	names(TotalPValMat)=Nvec
	row.names(TotalPValMat)=Nvec

	TotalSEMat=matrix(rep(0,length(Nvec)*length(Nvec)),nrow=length(Nvec))
	TotalSEMat=data.frame(TotalSEMat)
	names(TotalSEMat)=Nvec
	row.names(TotalSEMat)=Nvec

	TotalCount=matrix(rep(0,length(Nvec)*length(Nvec)),nrow=length(Nvec))
	TotalCount=data.frame(TotalCount)
	names(TotalCount)=Nvec
	row.names(TotalCount)=Nvec

	q1=match(GG[[2]][,3],Nvec)
	q2=match(GG[[2]][,1],Nvec)
	EffVals=GG[[1]]
	PVals=GGp[[1]]
	SEVals=GGse[[1]]
	for(i in 1:length(EffVals)){
		TotalEffMat[q1[i],q2[i]]=EffVals[i]
		TotalSEMat[q1[i],q2[i]]=SEVals[i]
		TotalPValMat[q1[i],q2[i]]=PVals[i]
		TotalCount[q1[i],q2[i]]=1
		}
	
	return(c("TotalEffects"=list(TotalEffMat),"TotalEffectsStandardError"=list(TotalSEMat),"TotalEffectsPVals"=list(TotalPValMat),"TotalEffectsCount"=list(TotalCount)))}

CreateTotalSummary<-function(AllTots,GreaterThanNum){	
	AllEffs=lapply(AllTots,OnlyNumberElement,1)
	AllSE=lapply(AllTots,OnlyNumberElement,2)
	AllPVal=lapply(AllTots,OnlyNumberElement,3)
	AllTCount=lapply(AllTots,OnlyNumberElement,4)
	AllSum=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllSumSE=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllSumPVal=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllSumCount=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllminPVal=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllmaxPVal=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))
	AllmedPVal=matrix(c(rep(0,ncol(AllEffs[[1]])*nrow(AllEffs[[1]]))),nrow=nrow(AllEffs[[1]]))

	for(i in 1:length(AllEffs)){
		AllSum=AllSum+AllEffs[[i]]
		AllSumSE=AllSumSE+AllSE[[i]]
		AllSumPVal=AllSumPVal+AllPVal[[i]]
		AllSumCount=AllSumCount+AllTCount[[i]]
		}
	AvgTotPVal=(AllSumPVal)/(AllSumCount+.0000001)
	AvgSEVal=AllSumSE/(AllSumCount+.0000001)
	AvgEff=AllSum/(AllSumCount+.0000001)
	for(i in 1:nrow(AvgEff)){
		for(j in 1:ncol(AvgEff)){
			if(AllSumCount[i,j]<=GreaterThanNum){
				AvgTotPVal[i,j]=0
				AvgSEVal[i,j]=0
				AvgEff[i,j]=0
				}
			}
		}
	for(i in 1:nrow(AvgEff)){
		for(j in 1:nrow(AvgEff)){
			if(AllSumCount[i,j]>GreaterThanNum){
				PValStore=c()
				for(k in 1:length(AllPVal)){
					PValStore=c(PValStore,AllPVal[[k]][i,j])
					}
				AllminPVal[i,j]=min(PValStore)
				AllmaxPVal[i,j]=max(PValStore)
				AllmedPVal[i,j]=median(PValStore)	
				}
			}
		}
	return("TotalEffects"=c("Count"=list(AllSumCount),"AverageEffects"=list(AvgEff),"AverageStandardError"=list(AvgSEVal),"AveragePVal"=list(AvgTotPVal),"MinPval"=list(AllminPVal),"MaxPVal"=list(AllmaxPVal),"MedianPVal"=list(AllmedPVal)))}

AllTotalEffOutput<-function(AllDat,GreaterThanNum=0,Directry=getwd()){
	AllFileNames1=sapply(AllDat,OnlyNumberElement,1)
	Tots1=lapply(AllFileNames1,CreateTotalEffMat,Directry)	
	AllTotEffOutput1=CreateTotalSummary(Tots1,GreaterThanNum)
	return(AllTotEffOutput1)}


###########################################################################################
##########################################################################################
#Part 6 changes names of thresholds by matching up M plus data file which old data

NewNamesThresh<-function(FileName,DataName,ThreshName,InitialData,Directry=getwd(),NADes=c(-99)){

	SpaceRowRead<-function(LineNum,BigFile){
		lineWspcs=paste(BigFile[LineNum,],collapse=" ")
		lineWspcs1=strsplit(lineWspcs," ")
		lineWspcs1=lineWspcs1[[1]][which(is.na(match(lineWspcs1[[1]],""))==TRUE)]
		return(lineWspcs1)
		}	
	
	StrThresh=strsplit(ThreshName,"")[[1]]
	LocDlrSgn=which(StrThresh=="$")
	N=names(InitialData)
	WhichVar=which(N==substr(ThreshName,1,LocDlrSgn-1))
	MPlusThresh=substr(ThreshName,LocDlrSgn+1,nchar(ThreshName))
		
	TO=paste0(Directry,"/",FileName)
	BigFile=read.delim(paste0(TO,"/","MPLUS",DataName,".txt"),sep="\t")
	LineNums=sapply(seq(1,nrow(BigFile)),list)
	NewFile=sapply(LineNums,SpaceRowRead,BigFile)
	NewFile=t(NewFile)

	OrigData=read.delim(paste0(TO,"/",DataName,".dat"),sep="\t")
	OrigDataMTCHIndx=which(is.na(match(OrigData[,WhichVar],NADes)==TRUE))

	MPlusMatchThreshIndex=suppressWarnings(which(match(as.numeric(NewFile[,WhichVar]),as.numeric(MPlusThresh))==1))
	IDMPlusData=NewFile[MPlusMatchThreshIndex,ncol(NewFile)]

	MTCHs=unlist(sapply(sapply(IDMPlusData,list),match,as.character(OrigData[OrigDataMTCHIndx,ncol(OrigData)])))

	OriginalVarName=OrigData[OrigDataMTCHIndx,WhichVar][MTCHs]
	return(OriginalVarName[1])}
## End(Don't show)
## Not run: 
##D #example 1
##D #creates generated data set and stores as InitD
##D InitD=Simulate(exampleNum=1) 
##D xxx=Initialize(InitD,WhichCat=c(1,1,1,1,1)) 
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D yyy$DirectEffects
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D www=CalculatRiskRatios(AllDat1[[1]],NADes=c(-99),WhichCat=c(1,1,1,1,1),
##D WhichRiskCalc=c(0,0,0,0,0))
##D www=CalculatRiskRatios(AllDat1[[1]],NADes=c(-99),WhichCat=c(1,1,1,1,1),
##D WhichRiskCalc=c(0,0,list(c(3,4,5)),0,0))
##D RRT1=lapply(AllDat1,TotalRiskRatios,InputDepVal=1)
##D 
##D #example 2
##D Simulated=Simulate(n=900,MissingYN=1,exampleNum=2)
##D #MissingYN is 1 for add missing data 0 is default which is don't add missing data
##D uu=Initialize(Simulated,NumImpute=3,WhichCat=c(1,1,1,1,1,0,1,0,0),
##D DataFileName="Example2",NameFile="Example2D",
##D Directry=getwd(),WhichRowsImp=c(1:450))
##D #NumImpute is the number of imputed datasets
##D AB=AllBackwardSelect(uu[[1]],Directry=getwd(),PSig=0.04)
##D DE=AllSummary2(uu[[1]],Directry=getwd())
##D DE$DirectEffects
##D AllDat1=ConvertData2(uu[[1]],uu[[2]],DE[[1]])
##D wwwA=lapply(AllDat1,CalculatRiskRatios,NADes=c(-99),
##D Directry=getwd(),
##D WhichCat=c(1,1,1,1,1,0,1,0,0),WhichRiskCalc=c(0,0,0,0,0,0,0,0,0))
##D AvgwwwA=AverageRRs(wwwA,GreaterThanCountNum=0)
##D #Average Risk Ratios for direct effects
##D RRT1=lapply(AllDat1,TotalRiskRatios,InputDepVal=1,
##D Directry=getwd())
##D RRT1avg=AverageRRs(RRT1,GreaterThanCountNum=0)
##D TotsAllEff=AllTotalEffOutput(AllDat1,Directry=getwd())
##D NewNamesThresh(FileName="Example2D_1000",DataName="Example2_1000",ThreshName="G$2",
##D InitialData=Simulated,Directry=getwd(),NADes=c(-99))
##D 
##D #example 3
##D #Note if not specifying a new directory or filename as below, 
##D #make sure files from example 1 are deleted
##D #otherwise this example won't work
##D InitD=Simulate(MissingYN=0,exampleNum=3)
##D 
##D InitializeMat=matrix(c(rep(0,ncol(InitD)*ncol(InitD))),nrow=ncol(InitD))
##D InitializeMat[upper.tri(InitializeMat)]=1
##D InitializeMat=data.frame(InitializeMat)
##D names(InitializeMat)=names(InitD)
##D row.names(InitializeMat)=names(InitD)
##D InitializeMat[8,]=c(0,0,0,0,0,0,0,0)
##D InitializeMat[6,]=c(0,0,0,0,0,0,0,0)
##D 
##D xxx=Initialize(InitD,NumImpute=0,WhichCat=c(1,1,1,1,1,0,1,0),
##D InputInitializeMat=InitializeMat,PasteIND=1,DataFileName="Example3",NameFile="Example3D")
##D #If PasteIND=0 then we are not examining all indirect effects this can be 
##D #used for larger numbers of variables in data sets but default it PasteIND=1
##D 
##D ggg=AllBackwardSelect(xxx[[1]])
##D yyy=AllSummary2(xxx[[1]])
##D AllDat1=ConvertData2(xxx[[1]],xxx[[2]],yyy[[1]])
##D www=CalculatRiskRatios(AllDat1[[1]],NADes=c(-99),WhichCat=c(1,1,1,1,1,0,1,0)
##D ,WhichRiskCalc=c(0,0,0,0,0,0,0,0))
##D 
##D RRT1=lapply(AllDat1,TotalRiskRatios,InputDepVal=1)
## End(Not run)



