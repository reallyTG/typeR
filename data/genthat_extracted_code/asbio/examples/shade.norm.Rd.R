library(asbio)


### Name: shade.norm
### Title: Shading functions for interpretation of pdf probabilities.
### Aliases: shade shade.norm shade.t shade.F shade.chi shade.bin shade.poi
###   shade.wei
### Keywords: graphs univar

### ** Examples

## Not run: 
##D ##normal
##D shade.norm(x=1.2,sigma=1,mu=0,tail="lower")
##D shade.norm(x=1.2,sigma=1,mu=0,tail="upper")
##D shade.norm(x=1.2,sigma=1,mu=0,tail="two")
##D shade.norm(from=-.4,to=0,sigma=1,mu=0,tail="middle")
##D shade.norm(from=0,to=0,sigma=1,mu=0,tail="middle")
##D shade.norm(x=c(-0.2, 2),sigma=1,mu=0,tail="two.custom")
##D 
##D ##t
##D shade.t(x=-1,nu=5,tail="lower")
##D shade.t(x=-1,nu=5,tail="upper")
##D shade.t(x=-1,nu=5,tail="two")
##D shade.t(from=.5,to=.7,nu=5,tail="middle")
##D                                                                                         
##D ##F
##D shade.F(x=2,nu1=15,nu2=8,tail="lower")
##D shade.F(x=2,nu1=15,nu2=8,tail="upper")
##D shade.F(nu1=15,nu2=8,tail="two",prob.to.each.tail=0.025)
##D shade.F(from=.5,to=.7,nu1=15,nu2=10,tail="middle")
##D 
##D ##Chi.sq
##D shade.chi(x=2,nu=5,tail="lower")
##D shade.chi(x=2,nu=5,tail="upper")
##D shade.chi(nu=7,tail="two",prob.to.each.tail=0.025)
##D shade.chi(from=.5,to=.7,nu=5,tail="middle")
##D 
##D ##binomial
##D shade.bin(x=5,n=20,tail="X=x",show.d=TRUE)
##D shade.bin(x=5,n=20,tail="lower")
##D shade.bin(x=5,n=20,tail="two")
##D shade.bin(from=8,to=12,n=20,tail="middle")
##D 
##D ##Poisson
##D shade.poi(x=5,lambda=6,tail="X=x",show.d=TRUE)
##D shade.poi(x=5,lambda=7,tail="lower")
##D shade.poi(x=5,lambda=8,tail="upper")
##D shade.poi(from=8,to=12,lambda=7,tail="middle")
## End(Not run)



