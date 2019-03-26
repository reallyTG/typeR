library(deltaPlotR)


### Name: deltaPlot
### Title: Delta Plot method for dichotomous DIF
### Aliases: deltaPlot print.deltaPlot

### ** Examples


 # Loading of the verbal data
 data(verbal)
 attach(verbal)

 # Excluding the "Anger" variable
 verbal <- verbal[colnames(verbal)!="Anger"]

 # Basic Delta plot, threshold 1.5, no item purification
 res <- deltaPlot(data=verbal, type="response", group=25, focal.name=1, purify=FALSE, 
                  thr=1.5)

 # Equivalent writing
 res <- deltaPlot(data=verbal, type="response", group="Gender", focal.name=1, 
                  purify=FALSE, thr=1.5)

 # Using proportions of correct responses as input
 dataRef <- verbal[verbal[,25]==0,1:24]
 dataFoc <- verbal[verbal[,25]==1,1:24]
 p0 <- colMeans(dataRef)
 p1 <- colMeans(dataFoc)
 res.1 <- deltaPlot(data=cbind(p0,p1), type="prop", purify=FALSE, thr=1.5)

 # Using Delta values as input
 Delta <- 4*qnorm(1-cbind(p0,p1))+13
 res.2 <- deltaPlot(data=Delta, type="delta", purify=FALSE, thr=1.5)

 # 'norm' threshold
 res <- deltaPlot(data=verbal, type="response", group="Gender", focal.name=1, 
                  purify=FALSE, thr="norm")

 # Keeping the first 10 items to exhibit DIF
 data <- verbal[,c(1:10,25)]
 deltaPlot(data=data, type="response", group=11, focal.name=1, purify=FALSE, thr="norm")
   # Item 8 is flagged as DIF

 # Item purification with the three processes
 res0 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr=1.5, purType="IPP1") 
 res0 # No DIF item detected

 res1 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP1") 
 res1 # Item 8 flagged as DIF after 2 iterations

 res2 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP2") 
 res2 # Item 8 flagged as DIF after 2 iterations

 res3 <- deltaPlot(data=data, type="response", group=11, focal.name=1, purify=TRUE, 
           thr="norm", purType="IPP3") 
 res3 # Items 6, 7 and 8 flagged as DIF after 4 iterations

 # Printing the full results of item purification
 print(res, only.final=FALSE)
 print(res0, only.final=FALSE)
 print(res1, only.final=FALSE)
 print(res2, only.final=FALSE)
 print(res3, only.final=FALSE)



