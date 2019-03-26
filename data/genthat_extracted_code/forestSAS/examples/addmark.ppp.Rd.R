library(forestSAS)


### Name: addmark.ppp
### Title: Add marks for a point pattern
### Aliases: addmark.ppp

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



