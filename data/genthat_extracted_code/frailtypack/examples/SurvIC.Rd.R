library(frailtypack)


### Name: SurvIC
### Title: Create a survival object for interval censoring and possibly
###   left truncated data
### Aliases: SurvIC

### ** Examples



## Not run: 
##D 
##D data(bcos)
##D bcos$event <- ifelse(bcos$left!=bcos$right,1,0)
##D 
##D ###---  Cox proportional hazard model with interval censoring ---###
##D 
##D cox.ic <- frailtyPenal(SurvIC(left,right,event)~treatment,
##D data=bcos,n.knots=8,kappa=10000)
##D 
##D ###---  Shared model with interval censoring ---###
##D 
##D bcos$group <- c(rep(1:20,4),1:14)
##D 
##D sha.ic <- frailtyPenal(SurvIC(left,right,event)~cluster(group)+
##D treatment,data=bcos,n.knots=8,kappa=10000)
##D 
## End(Not run)





