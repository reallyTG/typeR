library(lifecontingencies)


### Name: IAxn
### Title: Increasing life insurance
### Aliases: IAxn

### ** Examples


		#assumes SOA example life table to be load
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate the value of a 10 years increasing term life insurance for an aged 25
		IAxn(actuarialtable=soa08Act, x=25, n=10) 




