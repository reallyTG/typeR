library(forestSAS)


### Name: storeydvd
### Title: Dividing the forest storeies
### Aliases: storeydvd

### ** Examples

library(spatstat)
data(finpines)
finpinesdata<-as.data.frame(finpines)
####Dividing the stories
finpines.storey<-storeydvd(finpinesdata$height,storeynum=6)
finpines.storey

####Computing the storey differation
##Add the storey mark for finepines
finpines.addstorey<-addmark.ppp(finpines,
              add.mark=finpines.storey$heightdata[,2:3],
                    add.name=c("interval","storey" ))
finpines.addstorey
##Compute the storeies of nearest neighbour in the point pattern
finpines.nnstorey<-nnIndex(finpines.addstorey,smark="storey",N=4,
                           buf.xwid =2,buf.ywid=3)
##Compute the stoery differation
finpines.H<-fsasN4(finpines.nnstorey$nnstorey,match.fun=differ)
finpines.H



