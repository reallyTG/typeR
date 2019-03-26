library(compositions)


### Name: simplemissingplot
### Title: Ternary diagrams
### Aliases: simpleMissingSubplot
### Keywords: hplot

### ** Examples

data(SimulatedAmounts)
plot(acomp(sa.missings))
plot(acomp(sa.missings),mp=~simpleMissingSubplot(c(0,0.1,0.2,1),
   missingInfo[c(1,3:5,2)], 
   c("Not Missing",paste("Missing Only:",cn),"Totally Missing"),
   col=c("gray","red","green","blue","darkgray"))
)
ms <- missingSummary(sa.missings)
for( i in 1:3 )
  simpleMissingSubplot(c(0.9+0.03*(i-1),0.9+0.03*i,0.2,1), ms[i,])



