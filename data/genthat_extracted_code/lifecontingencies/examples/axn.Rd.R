library(lifecontingencies)


### Name: axn
### Title: Annuity immediate and due function.
### Aliases: axn

### ** Examples

		#assume SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate and life-long annuity for an aged 65
		axn(soa08Act, x=65) 



