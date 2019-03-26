library(Factoshiny)


### Name: print.MFAshiny
### Title: Print the MFAshiny results
### Aliases: print.MFAshiny
### Keywords: print

### ** Examples

## Not run: 
##D data(wine)
##D res<- MFA(wine, group=c(2,5,3,10,9,2), type=c("n",rep("s",5)),
##D     ncp=5, name.group=c("orig","olf","vis","olfag","gust","ens"),
##D     num.group.sup=c(1,6),graph=FALSE)
##D res.shiny=MFAshiny(res)
##D 
##D #click on the "Quit the app" button
##D print(res.shiny)
## End(Not run)



