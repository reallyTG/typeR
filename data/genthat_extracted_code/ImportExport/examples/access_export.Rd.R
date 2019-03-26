library(ImportExport)


### Name: access_export
### Title: Export multiple R data sets to Microsoft Office Access
### Aliases: access_export
### Keywords: access_export

### ** Examples

## Not run: 
##D # x is a data.frame
##D file<-("mydata.xlsx")
##D a<- 1:10
##D b<-rep("b",times=10)
##D c<-rep(1:2,each=5)
##D x<-data.frame(a,b,c)
##D excel_export(x,file,table_names="mydata")
##D # x is a list
##D y<-list(x,x[2:3])
##D excel_export(y,file,table_names=c("mydata1","mydata2"))
##D  
## End(Not run)



