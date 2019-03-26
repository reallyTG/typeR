library(lifecontingencies)


### Name: Tx
### Title: Number of person-years lived after exact age x
### Aliases: Tx
### Keywords: ~kwd1 ~kwd2

### ** Examples


		#assumes SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		Tx(soa08Act, 67)




