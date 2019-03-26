library(lifecontingencies)


### Name: mxt
### Title: Central mortality rate.
### Aliases: mxt

### ** Examples

		#assumes SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#compare mx and qx 
		mxt(soa08Act, 60,10)
		qxt(soa08Act, 60,10)



