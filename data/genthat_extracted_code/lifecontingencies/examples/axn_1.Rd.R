library(lifecontingencies)


### Name: Axn
### Title: Function to evaluate life insurance.
### Aliases: Axn

### ** Examples

	
		#assume SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate the value of a 40 years term life insurance for an aged 25
		Axn(actuarialtable=soa08Act, x=25, n=40) 
		#check an relevant life contingencies relationship
		k=12
		i=0.06
		j=real2Nominal(i,k)
		Axn(soa08Act, 30,k=12)
		i/j*Axn(soa08Act, 30,k=1)
	


