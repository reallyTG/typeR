library(rtf)


### Name: addTable.RTF
### Title: Insert a table into the RTF document
### Aliases: addTable.RTF RTF.addTable addTable,RTF-method
### Keywords: methods

### ** Examples

 rtf<-RTF("test_addTable.doc",width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
 addTable(rtf,as.data.frame(head(iris)),font.size=10,row.names=FALSE,NA.string="-",
          col.widths=rep(1,5))

 tab<-table(iris$Species,floor(iris$Sepal.Length))
 names(dimnames(tab))<-c("Species","Sepal Length")
 addTable(rtf,tab,font.size=10,row.names=TRUE,NA.string="-",col.widths=c(1,rep(0.5,4)) )

 done(rtf)
 


