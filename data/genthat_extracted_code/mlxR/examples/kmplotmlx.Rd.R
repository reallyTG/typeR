library(mlxR)


### Name: kmplotmlx
### Title: Kaplan Meier plot
### Aliases: kmplotmlx

### ** Examples

## Not run: 
##D tteModel1 <- inlineModel("
##D   [LONGITUDINAL]
##D   input = {beta,lambda}  
##D   EQUATION:
##D   h=(beta/lambda)*(t/lambda)^(beta-1)
##D   DEFINITION:
##D   e = {type=event, maxEventNumber=1, rightCensoringTime=70, hazard=h}
##D   ")
##D 
##D   p1   <- c(beta=2.5,lambda=50)
##D   e    <- list(name='e', time=0)
##D   res1 <- simulx(model=tteModel1, parameter=p1, output=e, group=list(size=100))
##D   pl1  <- kmplotmlx(res1$e,level=0.95)
##D   print(pl1)
##D 
##D   p2   <- c(beta=2,lambda=45)
##D   g1   <- list(size=50, parameter=p1)
##D   g2   <- list(size=100, parameter=p2)
##D   res2 <- simulx(model=tteModel1, output=e, group=list(g1,g2))
##D   pl2  <- kmplotmlx(res2$e)
##D   print(pl2)
## End(Not run)



