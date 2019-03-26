library(rtf)


### Name: addPlot.RTF
### Title: Insert a plot into the RTF document
### Aliases: addPlot.RTF RTF.addPlot addPlot,RTF-method
### Keywords: methods

### ** Examples

 rtf<-RTF("test_addPlot.doc",width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
 addPlot(rtf,plot.fun=plot,width=6,height=6,res=300, iris[,1],iris[,2])
 done(rtf)
 


