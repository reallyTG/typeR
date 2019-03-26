library(SEERaBomb)


### Name: mkExcelCsd
### Title: Make RR Excel file from csd output
### Aliases: mkExcelCsd
### Keywords: IO

### ** Examples

## Not run: 
##D library(SEERaBomb)
##D pm=simSeerSet()
##D pm=mk2D(pm) 
##D mybrks=c(0,1,5,10)
##D pm=csd(pm,brkst=mybrks,trts=c("noRad","rad")) 
##D (lab=paste0("b",paste(mybrks,collapse="_")))
##D (L=mkExcelCsd(pm,lab))
##D (L=mkExcelCsd(pm,lab,flip=TRUE))
## End(Not run)




