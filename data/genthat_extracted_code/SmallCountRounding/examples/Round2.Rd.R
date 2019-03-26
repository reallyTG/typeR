library(SmallCountRounding)


### Name: Round2
### Title: Small count rounding by various methods
### Aliases: Round2
### Keywords: internal

### ** Examples

## Not run: 
##D z <- SmallCountData("sosialFiktiv")
##D d <- list(c("region","mnd") , c("hovedint","mnd2") , c("fylke","hovedint","mnd2") , 
##D           c("kostragr","hovedint","mnd"))
##D con <- MakeControl(d,z)
##D sor <- names(z)[c(4,5,3,2,1)]
##D 
##D roundedA <-  Round2(data=z,b=3,d=d,micro=FALSE,sort=sor,control=con, nin="ant",nout="Rndtall",
##D                     minit=2,maxit=10,maxdiff=5,seed=123,method="roundtabs")
##D roundedB <-  Round2(data=z,b=3,d=d,micro=FALSE,sort=sor,control=con, nin="ant",nout="Rndtall",
##D                     minit=2,maxit=10,maxdiff=5,seed=123,method="viadummy")
##D #10 rows of rounded data
##D roundedA$Ar[1:10,]  #"roundtabs"
##D cbind(z,roundedB$yInner)[1:10,] #"viadummy"
##D 
##D # recalculate maxdiff  nMaxdiff
##D dA <- FindMaxDiff(roundedA$Ar,con,"ant","m")
##D dB <- FindMaxDiff(z,con,roundedB$yInner[,1],roundedB$yInner[,2])
##D 
##D # Formula from d and control
##D Lists2formula(d,con,z)
##D 
##D # Formula from another d
##D d2 <-list(sor)
##D Lists2formula(d2,con,z)
##D Lists2formula(d2,con) # Without knowing data
##D Lists2formula(d2,data=z) # Without control
##D Lists2formula(d2,data=z) # Without control and data
## End(Not run)



