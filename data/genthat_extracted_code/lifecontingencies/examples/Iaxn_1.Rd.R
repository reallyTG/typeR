library(lifecontingencies)


### Name: Iaxn
### Title: Increasing annuity life contingencies
### Aliases: Iaxn

### ** Examples

		#using SOA illustrative life tables
		data(soaLt)
		soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
		x=x,lx=Ix,name="SOA2008"))
		#evaluate the value of a lifetime increasing annuity for a subject aged 80
		Iaxn(actuarialtable=soa08Act, x=80, n=10)



