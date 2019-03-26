library(compositions)


### Name: idt
### Title: Isometric default transform
### Aliases: idt idt.default idt.acomp idt.ccomp idt.rcomp idt.aplus
###   idt.rplus idt.rmult idt.factor idtInv idtInv.default idtInv.acomp
###   idtInv.ccomp idtInv.rcomp idtInv.aplus idtInv.rplus idtInv.rmult
### Keywords: multivariate

### ** Examples

## Not run: 
##D # the idt is defined by
##D idt         <- function(x) UseMethod("idt",x)
##D idt.default <- function(x) x
##D idt.acomp   <- function(x) ilr(x) 
##D idt.rcomp   <- function(x) ipt(x) 
##D idt.aplus   <- ilt 
##D idt.rplus   <- iit 
## End(Not run)
idt(acomp(1:5))
idt(rcomp(1:5))
  data(Hydrochem)
  x = Hydrochem[,c("Na","K","Mg","Ca")]
  y = acomp(x)
  z = idt(y)
  y2 = idtInv(z,y)
  par(mfrow=c(2,2))
  for(i in 1:4){plot(y[,i],y2[,i])}



