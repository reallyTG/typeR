library(adespatial)


### Name: plot.TBI
### Title: Plots of the outputs of a temporal beta diversity analysis
### Aliases: plot.TBI

### ** Examples


if(require("vegan", quietly = TRUE)) {

## Example 1 -

## Invertebrate communities subjected to insecticide treatment.

## As an example in their paper on Principal Response Curves (PRC method), van den 
## Brink & ter Braak (1999) used observations on the abundances of 178 invertebrate 
## species (macroinvertebrates and zooplankton) subjected to treatments in 12 mesocosms 
## by the insecticide chlorpyrifos. The mesocosms were sampled at 11 occasions. The 
## data, available in the {vegan} package, are log-transformed species abundances, 
## ytranformed = loge(10*y+1).

## The data of survey #4 will be compared to those of survey #11 in this example. 
## Survey #4 was carried out one week after the insecticide treatment, whereas the  
## fauna of the mesocosms was considered by the authors to have fully recovered from  
## the insecticide treatment at survey #11.

data(pyrifos)

## The mesocosms had originally been attributed at random to the treatments. However, 
## to facilitate presentation of the results, they will be listed here in order of 
## increased insecticide doses: {0, 0, 0, 0, 0.1, 0.1, 0.9, 0.9, 6, 6, 44, 44} 
## micro g/L.

## Select the 12 data rows of surveys 4 and 11 from the data file and reorder them

ord4 <- c(38,39,41,47,37,44,40,46,43,48,42,45)
ord11 <- c(122,123,125,131,121,128,124,130,127,132,126,129)

## Run the TBI function

res1 <- TBI(pyrifos[ord4,], pyrifos[ord11,], method = "%diff", nperm = 0, test.t.perm = FALSE)

res1$BCD.mat

## Draw BC plots

par(mfrow=c(1,2))

s.names <- paste("Surv",1:12,sep=".")

## In the 1st plot, the symbols have diameters proportional to the site TBI statistics 

plot(res1, s.names=s.names, col.bg="red", pch.loss=21, pch.gain=22, 
main="B-C plot, Pyrifos, surveys 4 & 11")

## In the 2nd plot, control the axes limit values by specifying xlim and ylim

plot(res1, s.names=1:12, col.bg="green", pch.loss=23, pch.gain=24, 
main="B-C plot, Pyrifos, surveys 4 & 11", xlim=c(0,0.5), ylim=c(0.1,0.6))

## In the 3rd plot, draw all symbols small and of the same size, using cex.symb=NULL

dev.off()

plot(res1, s.names=1:12, col.bg="gold", pch.loss=23, pch.gain=24, 
main="B-C plot, Pyrifos, surveys 4 & 11", cex.symb=NULL)

## Example 2 -

## This example uses the mite data available in vegan. Let us pretend that sites 1-20 
## represent a survey at time 1 (T1) and sites 21-40 a survey at time 2 (T2).

data(mite)

## Run the TBI function

res2 <- TBI(mite[1:20,],mite[21:40,],method="%diff",nperm=0,test.t.perm=FALSE)

res2$BCD.mat

## Draw BC plots

par(mfrow=c(1,2))

s.names=rownames(res2$BCD.mat)

## In the 1st plot, the symbols have diameters proportional to the site TBI statistics

plot(res2, s.names=s.names, col.bg="cadetblue2", pch.loss=21, pch.gain=22, 
main="B-C plot, Mite data")

# In the 2nd plot, control the axes limit values by specifying xlim and ylim

plot(res2, s.names=1:20, col.rim="coral2", pch.loss=19, pch.gain=15, 
main="B-C plot, Mite data", xlim=c(0,0.6), ylim=c(0,0.6))

}




