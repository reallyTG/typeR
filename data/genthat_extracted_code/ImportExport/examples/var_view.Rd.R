library(ImportExport)


### Name: var_view
### Title: Summarize variable information
### Aliases: var_view
### Keywords: value.labels labels

### ** Examples

require(ImportExport)
a<- 1:10
b<-rep("b",times=10)
c<-rep(1:2,each=5)
x<-data.frame(a,b,c)
attr(x$a,"label")<- "descr1"
attr(x$b,"label")<- NULL
attr(x$c,"label")<- "descr3"
attr(x$c,"value.labels")<-list("1"="Yes","2"="No")
var_view(x)




