library(CorReg)


### Name: showdata
### Title: To show the missing values of a dataset
### Aliases: showdata

### ** Examples

## Not run: 
##D    data<-mtcars
##D    require(CorReg)
##D   datamiss=Terminator(target = data,wrath=0.05)#5% of missing values
##D   showdata(datamiss)#plot positions of the missing values
##D   
##D   #missing values with a structure
##D   datamiss=Terminator(target = data,diag=1)#diag of missing values
##D   showdata(datamiss)#plot positions of the missing values (no full individuals, no full variable)
##D   
##D   opar=par(no.readonly = TRUE)
##D   showdata(X=cor(data),what="correl")
##D   par(opar)
##D 
## End(Not run)





