library(lifecontingencies)


### Name: DAxn
### Title: Decreasing life insurance
### Aliases: DAxn

### ** Examples

		#using SOA illustrative life tables
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate the value of a 10 years decreasing term life insurance for an aged 25
		DAxn(actuarialtable=soa08Act, x=25, n=10) 



