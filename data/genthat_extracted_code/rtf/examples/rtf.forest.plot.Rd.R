library(rtf)


### Name: rtf.forest.plot
### Title: Get an RTF encoded forest plot
### Aliases: rtf.forest.plot

### ** Examples

 ## Not run: 
##D  tab<-data.frame(
##D 	Label=c("Test1","Test2","Test3"),
##D  	HR=c(1,2,0.45),
##D  	Lower.CI=c(0.5,1.1,0.25),
##D  	Upper.CI=c(2,3.5,0.9),
##D  	stringsAsFactors=FALSE,
##D  	check.names=FALSE)
##D 
##D  # create forest plots by row
##D  forest.plot.args<-list(xlim=c(0.1,5),width=3.0,height=0.3,cex=1,lwd=0.75,res=300)
##D  tab$"HR Plot (log scale)"<-mapply(rtf.forest.plot,tab$HR,tab$Lower.CI,tab$Upper.CI,
##D 			MoreArgs=forest.plot.args)
##D 
##D  # rbind the x-scale to the table in the plot column
##D  xscale<-rtf.forest.plot.xscale(xlim=c(0.1,5),width=3.0,height=0.3,cex=1,
##D  			lwd=0.75,res=300)
##D 
##D  tab<-data.frame(lapply(tab, as.character),
##D  			stringsAsFactors=FALSE,
##D 			check.names=FALSE)
##D 
##D  tab<-rbind(tab,list("","","","",xscale))
##D 
##D  # write the RTF output
##D  rtf<-RTF("test_rtf.forest.plot.doc",width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
##D  addTable(rtf,tab,col.widths=c(0.75,0.75,0.75,0.75,3))
##D  done(rtf)
##D  
## End(Not run)
 


