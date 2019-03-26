library(SEERaBomb)


### Name: mkExcelTsd
### Title: Make RR Excel file from tsd function output
### Aliases: mkExcelTsd
### Keywords: internal

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D pm=simSeerSet()
##D pm=mk2D(pm) 
##D mybrks=c(0,1,5,10)
##D pm=tsd(pm,brkst=mybrks,trts=c("noRad","rad")) 
##D (lab=paste0("b",paste(mybrks,collapse="_")))
##D (L=mkExcelTsd(pm,lab))
##D (L=mkExcelTsd(pm,lab,flip=TRUE))
## End(Not run)




