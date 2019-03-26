library(extracat)


### Name: JBCI
### Title: The Joint Bertin Classification Index
### Aliases: JBCI

### ** Examples

## Not run: 
##D A <- optile( arsim(144*5*20,c(12,12),6,0.1) , iter = 1000)
##D 
##D p1 <- 0.1 + runif(5)
##D p1 <- p1/sum(p1)
##D 
##D A2 <- apply(A,1:2,function(z) rmultinom(1,z,p1))
##D A2 <- optile(A2, iter = 1000,return.type="table")
##D 
##D BCI(A)
##D BCI(A2)
##D 
##D DA2 <- subtable(A2,1:3)
##D names(DA2) <- c("X","Y","Z","Freq")
##D 
##D rmb(~Y+Z+X,data=DA2)
##D 
##D JBCI(A2,3)
## End(Not run)



