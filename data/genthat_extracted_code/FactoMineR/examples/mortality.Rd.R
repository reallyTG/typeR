library(FactoMineR)


### Name: mortality
### Title: The cause of mortality in France in 1979 and 2006
### Aliases: mortality
### Keywords: datasets

### ** Examples

data(mortality)

## Not run: 
##D res<-MFA(mortality,group=c(9,9),type=c("f","f"),
##D     name.group=c("1979","2006"))
##D 
##D plot(res,choix="freq",invisible="ind",habillage="group")
##D lines(res$freq$coord[1:9,1],mfa$freq$coord[1:9,2],col="red")
##D lines(res$freq$coord[10:18,1],mfa$freq$coord[10:18,2],col="green")
##D     
##D     
## End(Not run)



