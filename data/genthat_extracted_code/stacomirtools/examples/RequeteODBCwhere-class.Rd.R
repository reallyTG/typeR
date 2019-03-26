library(stacomirtools)


### Name: RequeteODBCwhere-class
### Title: Class "RequeteODBCwhere"
### Aliases: RequeteODBCwhere-class
### Keywords: classes

### ** Examples

showClass("RequeteODBCwhere")
## Not run: 
##D  test<-0
##D  object=new("RequeteODBCwhere")
##D  object@baseODBC=c("myodbcconnection","myusername","mypassword")
##D  object@select= "select * from mytable limit 100"
##D  # assuming mycol, mycol1 and mycol2 are numeric
##D  object@where=paste(" where mycol>",test,sep="")
##D  object@and=paste(" and mycol2>",test," and mycol3<",test,sep="")
##D  object@order_by=" order by mycol1" 
##D  object<-connect(object)
##D  ## now object@sql contains the syntax of the query. 
##D  ## By changing the test variable, one can see how the
##D  ## function might be usefull
##D  ##  object@query contains the resulting data.frame
##D  
## End(Not run)



