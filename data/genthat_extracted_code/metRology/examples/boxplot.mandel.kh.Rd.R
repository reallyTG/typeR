library(metRology)


### Name: boxplot.mandel.kh
### Title: Box plot of Mandel's h or k statistics
### Aliases: boxplot.mandel.kh
### Keywords: hplot

### ** Examples

   data(RMstudy)

   h <- with(RMstudy, mandel.h(RMstudy[2:9], g=Lab))
   boxplot(h, las=2) 
   	#Recall that for normally distributed data mandel's h should 
   	#have the same dispersion (and IQR) for all groups. But outliers adversely 
   	#affect the estimate of dispersion, so the interquartile ranges differ.
   	#The same effect also accounts for the many boxplot outliers visible
   	#inside the classical Mandel indicator lines; the indicators also 
   	#assume normality.
   	
   #with separators:
   boxplot(h, las=2, separators=TRUE)
   
   #With different labels and label colours:
   boxplot(h, las=2, outlier.labels=paste(1:nrow(h)), col.lab=1:5) 
   
   #... and a horizontal variant (note use of pos to change label positions)
   par(omd=c(0.1,1,0,1))		#to make room for axis labels
   boxplot(h, las=1, separators=TRUE, horizontal=TRUE, pos=1)




