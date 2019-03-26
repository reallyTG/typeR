library(mlxR)


### Name: catplotmlx
### Title: Plot Categorical Longitudinal Data
### Aliases: catplotmlx

### ** Examples

## Not run: 
##D   catModel <- inlineModel("
##D   [LONGITUDINAL]
##D   input =  {a,b}
##D   EQUATION:
##D   lp1=a-b*t
##D   lp2=a-b*t/2
##D   DEFINITION:
##D   y = {type=categorical, categories={1,2,3}, 
##D   logit(P(y<=1))=lp1, logit(P(y<=2))=lp2}
##D   ")
##D   
##D   y.out  <- list(name='y', time=seq(0, 100, by=4))
##D 
##D   Ng  <- 1000
##D   g1 <- list(size=Ng, parameter=c(a=6,b=0.2))
##D   res <- simulx(model=catModel, output=y.out, group=g1)
##D   catplotmlx(res$y)
##D   catplotmlx(res$y, breaks=seq(-2,102,by=8), color="purple") 
##D   catplotmlx(res$y, breaks=5, color="#490917") 
##D   
##D   g2 <- list(size=Ng, parameter=c(a=10,b=0.2))
##D   res <- simulx(model=catModel, output=y.out, group=list(g1,g2))
##D   catplotmlx(res$y) 
##D   catplotmlx(res$y, group="none")
##D   
##D   g3 <- list(size=Ng, parameter=c(a=6,b=0.4))
##D   g4 <- list(size=Ng, parameter=c(a=10,b=0.4))
##D   res <- simulx(model=catModel, output=y.out, group=list(g1,g2,g3,g4))
##D   catplotmlx(res$y)
##D    
##D   cov <- data.frame(id=levels(res$y$id), a=rep(c(6,10,6,10),each=Ng), 
##D                     b=rep(c(0.2,0.2,0.4,0.4),each=Ng))
##D   catplotmlx(res$y, group=cov) 
## End(Not run)



