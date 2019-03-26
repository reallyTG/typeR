library(heatmap3)


### Name: showAnn
### Title: showAnn
### Aliases: showAnn

### ** Examples

annData<-data.frame(mtcars[,c("mpg","am","wt","gear")])
annData[,2]<-as.factor(annData[,2])
annData[,4]<-as.factor(annData[,4])
#Display annotation
## Not run: 
##D showAnn(annData)
## End(Not run)
#Heatmap with annotation
heatmap3(t(mtcars),ColSideAnn=annData,ColSideFun=function(x)
showAnn(x),ColSideWidth=1.2,balanceColor=TRUE)



