library(OpasnetUtils)


### Name: opbase
### Title: OpasnetBase Access
### Aliases: opbase opbase.data opbase.locations opbase.obj.exists
###   opbase.series opbase.indices opbase.upload
### Keywords: database

### ** Examples

## Not run: 
##D # Read
##D 
##D opbase.data('op_en1390')
##D opbase.data('op_en2949', subset='2012', include = list('KUNTA' = 322), 
##D     range = list('ID_NRO' = c(20000, 30000), 'XKOORD' = c(NA,244000)))
##D 
##D # Write (works only within Opasnet when username nor password is given)
##D input <- matrix(c('male', 12334435.123, 22, 'female', 234345.23423, 33), 
##D     ncol=3, byrow=TRUE)
##D colnames(input) <- c("Sex","Some number","result")
##D input <- as.data.frame(input)
##D #res <- opbase.upload(input, ident="op_en1390", name = "Sandbox TEST", 
##D #    index_types = c('entity','number'), unit = "Age", who='Tester person')
## End(Not run)



