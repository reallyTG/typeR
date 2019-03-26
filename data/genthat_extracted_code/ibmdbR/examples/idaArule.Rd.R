library(ibmdbR)


### Name: idaArule
### Title: Association Rule Mining
### Aliases: idaArule idaApplyRules

### ** Examples
## Not run: 
##D 
##D idf <- ida.data.frame("GOSALES.ORDER_DETAILS")
##D 
##D r <- idaArule(idf,tid="ORDER_NUMBER",item="PRODUCT_NUMBER",minsupport=0.01)
##D 
##D inspect(r)
##D 
##D applyResult <- idaApplyRules(idaGetModelname(r),idf,"ORDER_NUMBER","PRODUCT_NUMBER")
##D 	
## End(Not run)


