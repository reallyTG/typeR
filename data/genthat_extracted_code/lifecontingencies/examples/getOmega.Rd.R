library(lifecontingencies)


### Name: getOmega
### Title: Function to return the terminal age of a life table.
### Aliases: getOmega

### ** Examples

		#assumes SOA example life table to be load
		data(soaLt)
		soa08=with(soaLt, new("lifetable",
		x=x,lx=Ix,name="SOA2008"))
		#the last attainable age under SOA life table is
		getOmega(soa08) 




