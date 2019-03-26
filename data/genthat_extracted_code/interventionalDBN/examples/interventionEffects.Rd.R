library(interventionalDBN)


### Name: interventionEffects
### Title: Calculate interventional effects
### Aliases: interventionEffects

### ** Examples

data(interventionalData)
effect1<-interventionEffects(interventionalData,1,"DMSO","EGFRi")
effect2<-interventionEffects(interventionalData,1,"DMSO","AKTi")
heats<-rbind(effect1$heatmap.p.values,effect2$heatmap.p.values)
image(heats, breaks=c(-1,-0.95,-0.9,0.9,0.95,1),
  col=c("red","darkred","black","darkgreen","green"),xaxt="n",yaxt="n",
  xlab="Green = up when inhibitor is present\nRed = down when inhibitor is present")
# Or use the package gplots for more colour graduation
#library("gplots")
#image(heats,breaks=c(-1,-0.999,-0.99,-0.975,-0.95,-0.9,0.9,0.95,0.975,0.99,0.999,1)
#  ,col=redgreen(11),xaxt="n",yaxt="n")
axis(1,0:1,c("EGFRi","AKTi"))
axis(2,0:14/14,colnames(effect1$p.values),las=1)



