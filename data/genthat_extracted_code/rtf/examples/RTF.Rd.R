library(rtf)


### Name: RTF
### Title: The RTF class
### Aliases: RTF
### Keywords: classes

### ** Examples

 ## Not run: 
##D  output<-"test_RTF-class.doc"
##D  png.res<-300
##D 
##D  rtf<-RTF(output,width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
##D  addHeader(rtf,title="Test",subtitle="2011-08-15\n")
##D  addPlot(rtf,plot.fun=plot,width=6,height=6,res=300, iris[,1],iris[,2])
##D 
##D  # Try trellis plots
##D  if(require(lattice) & require(grid)) {
##D  	# single page trellis objects
##D  	addPageBreak(rtf, width=11,height=8.5,omi=c(0.5,0.5,0.5,0.5))
##D 
##D  	p <- histogram( ~ height | voice.part, data = singer, xlab="Height")
##D  	addTrellisObject(rtf,trellis.object=p,width=10,height=7.5,res=png.res)
##D 
##D  	p <- densityplot( ~ height | voice.part, data = singer, xlab = "Height")
##D  	addTrellisObject(rtf,trellis.object=p,width=10,height=7.5,res=png.res)
##D 
##D  	# multipage trellis object
##D  	p2<-xyplot(uptake ~ conc | Plant, CO2, layout = c(2,2))
##D  	addTrellisObject(rtf,trellis.object=p2,width=6,height=6,res=png.res)
##D  }
##D 
##D  addPageBreak(rtf, width=6,height=10,omi=c(0.5,0.5,0.5,0.5))
##D  addTable(rtf,as.data.frame(head(iris)),font.size=10,row.names=FALSE,NA.string="-")
##D 
##D  addSessionInfo(rtf)
##D 
##D  done(rtf)
##D  
## End(Not run)
 


