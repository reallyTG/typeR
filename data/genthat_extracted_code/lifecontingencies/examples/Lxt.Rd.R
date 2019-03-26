library(lifecontingencies)


### Name: Lxt
### Title: Number of person - years lived.
### Aliases: Lxt

### ** Examples

		#assumes SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		Lxt(soa08Act, 67,10)



