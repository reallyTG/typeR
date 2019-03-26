library(optiRum)


### Name: convertToXML
### Title: Produce an XML document of a table
### Aliases: convertToXML
### Keywords: XML data.frame data.table xml

### ** Examples

df<-data.frame(nper=c(12,24),pmt=c(-10,-10),pv=c(110,220))
xml<-convertToXML(df,name='examples')




