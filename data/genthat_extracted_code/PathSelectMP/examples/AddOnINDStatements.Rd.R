library(PathSelectMP)


### Name: AddOnINDStatements
### Title: Indirect Effect List Creator
### Aliases: AddOnINDStatements
### Keywords: Indirect Effects helper

### ** Examples

## Don't show: 
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
## End(Don't show)
InitD=Simulate(n=1000)
InputInitializeMat=CreateInitializeMatrix(InitD,WhichCat=c(1,1,1,1,0))
IndList=AddOnINDStatements(InputInitializeMat,PasteIND=1)




