library(PathSelectMP)


### Name: PathNames
### Title: M Plus Path description
### Aliases: PathNames
### Keywords: Initialize helper

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

## End(Don't show)
InitD=Simulate()
cc=CreateInitializeMatrix(InitD,WhichCat=c(1,1,1,1,0))
PathNames(2,cc)




