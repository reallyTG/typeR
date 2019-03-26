library(PathSelectMP)


### Name: OnlyNumberElement
### Title: indexes list of lists
### Aliases: OnlyNumberElement
### Keywords: Index helper

### ** Examples

## Don't show: 
OnlyNumberElement<-function(AllData,Number){
	return(AllData[[Number]])}
## End(Don't show)
Dat=list(c(list("new1"),list("new2")),c(list("Old1"),list("Old2")))
AllFileNames1=sapply(Dat,OnlyNumberElement,1)



