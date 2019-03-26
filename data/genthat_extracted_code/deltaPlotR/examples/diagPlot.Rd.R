library(deltaPlotR)


### Name: diagPlot
### Title: Plot of the Deltas points from the Delta Plot method
### Aliases: diagPlot

### ** Examples


 # Loading of the verbal data
 data(verbal)
 attach(verbal)

 # Excluding the "Anger" variable
 verbal <- verbal[colnames(verbal)!="Anger"]

 # Basic Delta plot, threshold 1.5, no item purification
 res <- deltaPlot(data=verbal, type="response", group=25, focal.name=1, purify=FALSE, 
                  thr=1.5)

 # Keeping the first 10 items to exhibit DIF
 data <- verbal[,c(1:10,25)]
 res0 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=FALSE,
  thr="norm")
 res0 # Item 8 is flagged as DIF

 res1 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP3") 
 res1 # Items 6, 7 and 8 flagged as DIF after 4 iterations

 # Delta plot, default options
 diagPlot(res)
 diagPlot(res0)
 diagPlot(res1)

 # Drawing upper and lower bounds and removing the major axis
 diagPlot(res, axis.draw=FALSE, thr.draw=TRUE)
 diagPlot(res1, axis.draw=FALSE, thr.draw=TRUE)

 # Modifying the type of points for all and for DIF items
 diagPlot(res, pch=3, dif.draw=c(2,4))
 diagPlot(res1, pch=3, dif.draw=c(2,4))

 # Printing the correlation and modifying the axis limits
 diagPlot(res, xlim=c(9,20), ylim=c(9,20), print.corr=TRUE)
 diagPlot(res1, xlim=c(9,17), print.corr=TRUE)

 # Saving the plots as PDF and JPEG files, default folder, specific names
 diagPlot(res, save.plot=TRUE, save.options=c("res","default","pdf"))
 diagPlot(res1, save.plot=TRUE, save.options=c("res1","default","jpeg"))

 # Modifying the results to make two items be located on the same place
 res2<-res1
 res2$Deltas[9,]<-res2$Deltas[3,]
 diagPlot(res2)



