library(MOLHD)


### Name: cpf2
### Title: Combine Pareto front designs of 2 criteria
### Aliases: cpf2
### Keywords: Pareto front

### ** Examples


#Combine Pareto fronts each with 5 random starts for Mm and mp criteria
## Not run: 
##D pf1=pfMp(20,2,crlim = cbind(c(4.5,6.5),c(26,36)),nstarts = 5)
##D pf2=pfMp(20,2,crlim = cbind(c(4.5,6.5),c(26,36)),nstarts = 5)
##D pfnew=cpf2(pf1$pfdes,pf1$pfvals,pf2$pfdes,pf2$pfvals)
##D pfnew$pfdes
##D pfnew$pfvals
## End(Not run)



