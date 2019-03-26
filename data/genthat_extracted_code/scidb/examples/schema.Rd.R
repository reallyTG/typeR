library(scidb)


### Name: schema
### Title: SciDB array schema
### Aliases: schema

### ** Examples

## Not run: 
##D s <- scidbconnect()
##D x <- scidb(s,"build(<v:double>[i=1:10,2,0,j=0:19,1,0],0)")
##D schema(x)
##D # [1] "<v:double> [i=1:10:0:2; j=0:19:0:1]"
##D schema(x, "attributes")
##D #  name   type nullable
##D #1    v double     TRUE
##D schema(x, "dimensions")
##D   name start end chunk overlap
##D #1    i     1  10     2       j
##D #2    0     0  19     1       0
## End(Not run)



