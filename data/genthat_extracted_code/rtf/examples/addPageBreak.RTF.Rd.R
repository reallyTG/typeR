library(rtf)


### Name: addPageBreak.RTF
### Title: Insert a page break into the RTF document optionally specifying
###   new page settings
### Aliases: addPageBreak.RTF RTF.addPageBreak addPageBreak,RTF-method
### Keywords: methods

### ** Examples

 rtf<-RTF("test_addPageBreak.doc",width=8.5,height=11,font.size=10,omi=c(1,1,1,1))
 addPageBreak(rtf,width=11,height=8.5,omi=c(0.5,0.5,0.5,0.5))
 done(rtf)
 


