library(PathSelectMP)


### Name: SpecialMatch
### Title: Match and delete elements
### Aliases: SpecialMatch
### Keywords: Parse helper

### ** Examples

## Don't show: 
SpecialMatch<-function(ListO,DelL){
	for(i in 1:length(ListO)){
		ListO[[i]]=ListO[[i]][is.na(DelL[[i]])==TRUE]
		}
	return(ListO)}
## End(Don't show)
x=c()
x="    A$1                1.388      0.068     20.514      0.000"
x=c(x,"    B$1                1.858      0.139     13.340      0.000")
x=c(x,"    C$1                1.426      0.081     17.542      0.000")
x=c(x,"    D$1                1.644      0.092     17.934      0.000")
Thresh=x
AllThresh=sapply(Thresh,strsplit," ")
DL=lapply(AllThresh,match,"")
AllThreshNoSp=SpecialMatch(AllThresh,DL)



