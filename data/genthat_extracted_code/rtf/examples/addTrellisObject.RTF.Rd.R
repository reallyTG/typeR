library(rtf)


### Name: addTrellisObject.RTF
### Title: Insert a trellis plot object into the RTF document
### Aliases: addTrellisObject.RTF RTF.addTrellisObject
###   addTrellisObject,RTF-method
### Keywords: methods

### ** Examples

 ## Not run: 
##D  rtf<-RTF("test_addTrellisObject.doc",width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
##D  if(require(lattice) & require(grid)) {
##D  	# multipage trellis object
##D  	p2<-xyplot(uptake ~ conc | Plant, CO2, layout = c(2,2))
##D  	addTrellisObject(rtf,trellis.object=p2,width=8,height=4,res=300, rotate=90)
##D  }
##D  done(rtf)
##D  
## End(Not run)
 


