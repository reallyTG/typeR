library(SSBtools)


### Name: CbindIdMatch
### Title: Combine several data frames by using id variables to match rows
### Aliases: CbindIdMatch

### ** Examples

zA=data.frame(idA=1:10,idB=rep(10*(1:5),2),
              idC=rep(c(100,200),5),idC2=c(100,rep(200,9)),idC3=rep(100,10),
              idD=99,x=round(rnorm(10),3),xA=round(runif(10),2))
zB=data.frame(idB=10*(1:5),x=round(rnorm(5),3),xB=round(runif(5),2))
zC=data.frame(idC=c(100,200),x=round(rnorm(2),3),xC=round(runif(2),2))
zD=data.frame(idD=99,x=round(rnorm(1),3),xD=round(runif(1),2))
CbindIdMatch(zA,zB,zC,zD)
CbindIdMatch(a=zA,b=zB,c=zC,d=zD,idNames=c("","idB","idC",""))
CbindIdMatch(a=zA,b=zB,c=zC,d=zD,idNames1=c("","idB","idC2",""))
CbindIdMatch(a=zA,b=zB,c=zC,d=zD,idNames1=c("","idB","idC3",""))
CbindIdMatch(zA,zB,zC,zD,addName=c("","bbb","ccc","ddd"),sep=".",addLast=TRUE)
try(CbindIdMatch(X=zA,Y=zA[,4:5],Z=zC,idNames=NULL)) # Error
CbindIdMatch(X=zA,Y=zA[,4:5],Z=zD,idNames=NULL)      # Ok since equal NROW or NROW==1
CbindIdMatch(list(a=zA,b=zB,c=zC,d=zD))              # List is alternative input



