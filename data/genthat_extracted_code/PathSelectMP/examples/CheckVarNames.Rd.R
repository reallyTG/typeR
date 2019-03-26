library(PathSelectMP)


### Name: CheckVarNames
### Title: Variable Name Check
### Aliases: CheckVarNames
### Keywords: variables helper

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
	
## End(Don't show)
InitD=Simulate()
CheckVarNames(InitD)




