library(compositions)


### Name: CompLinModCoReg
### Title: Compositional Linear Model of Coregionalisation
### Aliases: CompLinModCoReg
### Keywords: multivariate

### ** Examples

## Not run: 
##D data(juraset)
##D X <- with(juraset,cbind(X,Y))
##D comp <- acomp(juraset,c("Cd","Cu","Pb","Co","Cr"))
##D CompLinModCoReg(~nugget()+sph(0.5)+R1*exp(0.7),comp)
##D CompLinModCoReg(~nugget()+R1*sph(0.5)+R1*exp(0.7)+(0.3*diag(5))*gauss(0.3),comp)
##D CompLinModCoReg(~nugget()+R1*sph(0.5)+R1(c(1,2,3,4,5))*exp(0.7),comp)
## End(Not run)



