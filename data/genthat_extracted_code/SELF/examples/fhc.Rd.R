library(SELF)


### Name: fhc
### Title: Fast Hill-Climbing
### Aliases: fhc

### ** Examples

## Not run: 
##D #x->y->z
##D set.seed(0)
##D x=rnorm(4000)
##D y=x^2+runif(4000,-1,1)*0.1
##D z=y^2+runif(4000,-1,1)*0.1
##D data=data.frame(x,y,z)
##D fhc(data,gamma=10,booster = "gbtree")
##D 
##D #x->y->z linear data
##D set.seed(0)
##D x=rnorm(4000)
##D y=3*x+runif(4000,-1,1)*0.1
##D z=3*y+runif(4000,-1,1)*0.1
##D data=data.frame(x,y,z)
##D fhc(data,booster = "lm")
##D 
##D #randomGraph with linear data
##D 
##D set.seed(0)
##D G=randomGraph(dim=10,indegree=1.5)
##D data=synthetic_data_linear(G=G,sample_num=4000)
##D fitG=fhc(data,booster = "lm")
##D indicators(fitG,G)
## End(Not run)




