library(MPTinR)


### Name: fit.mptinr
### Title: Fit cognitive models for categorical data using an objective
###   function
### Aliases: fit.mptinr
### Keywords: models tree

### ** Examples

## Not run: 
##D # the example may occasionally fail due to a starting values - integration mismatch.
##D 
##D # Fit an SDT for a 4 alternative ranking task (Kellen, Klauer, & Singmann, 2012).
##D 
##D ranking.data <- structure(c(39, 80, 75, 35, 61, 54, 73, 52, 44, 63, 40, 48, 80,
##D 49, 43, 80, 68, 53, 81, 60, 60, 65, 49, 58, 69, 75, 71, 47, 44,
##D 85, 23, 9, 11, 21, 12, 21, 14, 20, 19, 15, 29, 13, 14, 15, 22,
##D 11, 12, 16, 13, 20, 20, 9, 26, 19, 13, 9, 14, 15, 24, 9, 19,
##D 7, 9, 26, 16, 14, 6, 17, 21, 14, 20, 18, 5, 19, 17, 5, 11, 21,
##D 4, 9, 15, 17, 7, 17, 11, 11, 9, 19, 20, 3, 19, 4, 5, 18, 11,
##D 11, 7, 11, 16, 8, 11, 21, 1, 17, 18, 4, 9, 10, 2, 11, 5, 9, 18,
##D 6, 7, 5, 6, 19, 12, 3), .Dim = c(30L, 4L))
##D 
##D expSDTrank <- function(Q, param.names, n.params, tmp.env){
##D    
##D     e <- vector("numeric",4)
##D 
##D     mu <- Q[1]
##D     ss <- Q[2]
##D        
##D     G1<-function(x){
##D         ((pnorm(x)^3)*dnorm(x,mean=mu,sd=ss))
##D     }
##D 
##D     G2<-function(x){
##D         ((pnorm(x)^2)*dnorm(x,mean=mu,sd=ss)*(1-pnorm(x)))*3
##D     }
##D 
##D      G3<-function(x){
##D         (pnorm(x)*dnorm(x,mean=mu,sd=ss)*(1-pnorm(x))^2)*3
##D     }
##D  
##D 
##D     e[1] <- integrate(G1,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value    
##D     e[2] <- integrate(G2,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value
##D     e[3] <- integrate(G3,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value
##D     e[4] <- 1-e[1]-e[2]-e[3]  
##D    
##D     return(e)
##D }
##D 
##D 
##D 
##D SDTrank <- function(Q, data, param.names, n.params, tmp.env, lower.bound, upper.bound){
##D    
##D     e<-vector("numeric",4)
##D 
##D     mu <- Q[1]
##D     ss <- Q[2]
##D        
##D     G1<-function(x){
##D         ((pnorm(x)^3)*dnorm(x,mean=mu,sd=ss))
##D     }
##D 
##D     G2<-function(x){
##D         ((pnorm(x)^2)*dnorm(x,mean=mu,sd=ss)*(1-pnorm(x)))*3
##D     }
##D 
##D      G3<-function(x){
##D         (pnorm(x)*dnorm(x,mean=mu,sd=ss)*(1-pnorm(x))^2)*3
##D     }
##D  
##D 
##D     e[1] <- integrate(G1,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value    
##D     e[2] <- integrate(G2,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value
##D     e[3] <- integrate(G3,-Inf,Inf,rel.tol = .Machine$double.eps^0.5)$value
##D     e[4] <- 1-e[1]-e[2]-e[3]  
##D    
##D     LL <- -sum(data[data!=0]*log(e[data!=0]))
##D     return(LL)
##D }
##D 
##D fit.mptinr(ranking.data, SDTrank, c("mu", "sigma"), 4, prediction = expSDTrank, 
##D 		lower.bound = c(0,0.1), upper.bound = Inf)
##D  
## End(Not run)



