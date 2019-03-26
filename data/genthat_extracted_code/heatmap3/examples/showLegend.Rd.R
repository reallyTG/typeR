library(heatmap3)


### Name: showLegend
### Title: showLegend
### Aliases: showLegend

### ** Examples

RowSideColors<-rep("steelblue2",nrow(mtcars))
RowSideColors[c(4:6,15:17,22:26,29)]<-"lightgoldenrod"
RowSideColors[c(1:3,19:21)]<-"brown1"
heatmap3(mtcars,scale="col",margins=c(2,10),RowSideColors=RowSideColors,legendfun=function()
showLegend(legend=c("European","American","Japanese"),col=c("steelblue2","lightgoldenrod",
"brown1"),cex=1.5))



