library(forestHES)


### Name: vardis
### Title: Distribution of species attributes in the sample plots
### Aliases: vardis

### ** Examples

######when variabel catogory is numeric######
####Variable distribution according to the actual range of variable and sizeclass=1
data(treedata)
numericVar.actualsize1<-vardis(treedata,plot.id="plot.id",var="ht.m",
                                breaks=seq(min(treedata$ht.m),max(treedata$ht.m),1))
numericVar.actualsize1
####Variable distribution according to the actual range of variable and sizeclass=2
numericVar.actualsize2<-vardis(treedata,plot.id="plot.id",var="ht.m",
                                breaks=seq(min(treedata$ht.m),max(treedata$ht.m),2))
numericVar.actualsize2
##when the lower value of actual range of variable included,include.lowest can  set TRUE
numericVar.actualInlower<-vardis(treedata,plot.id="plot.id",var="ht.m",
                                  breaks=seq(min(treedata$ht.m),max(treedata$ht.m),1),
                                  include.lowest=TRUE)
numericVar.actualInlower
##when the upper value of actual range of variable excluded,include.lowest can be set FALSE
numericVar.actualExupper<-vardis(treedata,plot.id="plot.id",var="ht.m",
                                  breaks=seq(min(treedata$ht.m),max(treedata$ht.m),1),
                                  right=FALSE)
numericVar.actualExupper

####Variable distribution according to the specific range of variable
range(treedata$ht.m)
##[1]  2.6 32.2
##specific range can be set between 2 and 34, sizeclass is 2
numericVar.specific<-vardis(treedata,plot.id="plot.id",var="ht.m",
                             breaks=2*1:17)
numericVar.specific

######when variabel catogory is character######
characterVar<-vardis(treedata,varcat="character",plot.id="plot.id",var="spe.id")
characterVar



