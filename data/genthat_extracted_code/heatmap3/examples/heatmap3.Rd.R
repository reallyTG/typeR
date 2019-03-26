library(heatmap3)


### Name: heatmap3
### Title: heatmap3
### Aliases: heatmap3

### ** Examples

#gererate data
set.seed(123456789)
rnormData<-matrix(rnorm(1000), 40, 25)
rnormData[1:15, seq(6, 25, 2)] = rnormData[1:15, seq(6, 25, 2)] + 2
rnormData[16:40, seq(7, 25, 2)] = rnormData[16:40, seq(7, 25, 2)] + 4
colnames(rnormData)<-c(paste("Control", 1:5, sep = ""), paste(c("TrtA", "TrtB"),
rep(1:10,each=2), sep = ""))
rownames(rnormData)<-paste("Probe", 1:40, sep = "")
ColSideColors<-cbind(Group1=c(rep("steelblue2",5), rep(c("brown1", "mediumpurple2"),10)),
    Group2=sample(c("steelblue2","brown1", "mediumpurple2"),25,replace=TRUE))
colorCell<-data.frame(row=c(1,3,5),col=c(2,4,6),color=c("green4","black","orange2"),
    stringsAsFactors=FALSE)
highlightCell<-data.frame(row=c(2,4,6),col=c(1,3,5),color=c("black","green4","orange2"),
    lwd=1:3,stringsAsFactors=FALSE)
#A simple example
heatmap3(rnormData,ColSideColors=ColSideColors,showRowDendro=FALSE,colorCell=colorCell,
    highlightCell=highlightCell)
#A more detail example
ColSideAnn<-data.frame(Information=rnorm(25),Group=c(rep("Control",5), rep(c("TrtA", "TrtB"),10)))
row.names(ColSideAnn)<-colnames(rnormData)
RowSideColors<-colorRampPalette(c("chartreuse4", "white", "firebrick"))(40)
result<-heatmap3(rnormData,ColSideCut=1.2,ColSideAnn=ColSideAnn,ColSideFun=function(x)
showAnn(x),ColSideWidth=0.8,RowSideColors=RowSideColors,col=colorRampPalette(c("green",
"black", "red"))(1024),RowAxisColors=1,legendfun=function() showLegend(legend=c("Low",
"High"),col=c("chartreuse4","firebrick")),verbose=TRUE)
#annotations distribution in different clusters and the result of statistic tests
result$cutTable



