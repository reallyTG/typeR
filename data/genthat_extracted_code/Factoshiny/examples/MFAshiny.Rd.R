library(Factoshiny)


### Name: MFAshiny
### Title: Multiple Factor Analysis (MFA) with Factoshiny
### Aliases: MFAshiny

### ** Examples

## Not run: 
##D require(FactoMineR)
##D data(wine)
##D # Multiple Factor Analysis with Factoshiny:
##D res.shiny=MFAshiny(wine)
##D 
##D #If you want to create your groups first and customize your graphs
##D res.mfa= MFA(wine, group=c(2,5,3,10,9,2), type=c("n",rep("s",5)),
##D     ncp=5, name.group=c("orig","olf","vis","olfag","gust","ens"),
##D     num.group.sup=c(1,6))
##D res.shiny=MFAshiny(res.mfa)
## End(Not run)



