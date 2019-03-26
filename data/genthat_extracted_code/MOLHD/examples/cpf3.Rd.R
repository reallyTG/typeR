library(MOLHD)


### Name: cpf3
### Title: Combine Pareto front designs of 3 criteria
### Aliases: cpf3
### Keywords: Pareto front

### ** Examples


#Combine Pareto fronts each with 1 random start for Mm, mp and mM criteria
## Not run: 
##D pf1=pfMpm(20,2,crlim = cbind(c(4.5,6.5),c(26,36),c(0.12,0.62)),num = 15,nstarts = 1)
##D pf2=pfMpm(20,2,crlim = cbind(c(4.5,6.5),c(26,36),c(0.12,0.62)),num = 15,nstarts = 1)
##D pfnew=cpf3(pf1$pfdes,pf1$pfvals,pf2$pfdes,pf2$pfvals)
##D pfnew$pfdes
##D pfnew$pfvals
## End(Not run)



