library(zoib)


### Name: pred.zoib
### Title: posterior predictive samples of Y for given new X
### Aliases: pred.zoib

### ** Examples

## Not run: 
##D   data("GasolineYield")
##D   eg1 <- zoib(yield ~ temp + as.factor(batch)| 1, data=GasolineYield,
##D                  joint = FALSE,  random = 0, EUID = 1:nrow(d),
##D                  zero.inflation = FALSE, one.inflation = FALSE,
##D                  n.iter = 1600, n.thin = 2, n.burn=100, seeds=c(1,2),n.chain=2)
##D   xnew <- data.frame(temp = c(205, 218), batch = factor(c(1, 2), levels = 1:10))
##D   ypred <- pred.zoib(eg1, xnew)
##D   
##D   data("BiRepeated")
##D   eg2 <- zoib(y1|y2 ~ x|1|x, data= BiRepeated, n.response=2,
##D             random=1, EUID= BiRepeated$id,
##D             zero.inflation = FALSE, one.inflation = FALSE,				
##D             prior.Sigma = "VC.unif", n.iter=2100, n.thin=10, n.burn=100)
##D   xnew<- data.frame(x=BiRepeated[1:6,4])
##D   pred.zoib(eg2,xnew)
##D 	
## End(Not run)



