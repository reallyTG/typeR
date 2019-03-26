library(lifecontingencies)


### Name: Axyzn
### Title: Multiple lifes insurances and annuities
### Aliases: Axyzn axyzn

### ** Examples

	data(soaLt)
	soa08Act=with(soaLt, new("actuarialtable",interest=0.06,
	x=x,lx=Ix,name="SOA2008"))
	#evaluate and life-long annuity for an aged 65
	listOfTables=list(soa08Act, soa08Act) 
	#Check actuarial equality
	axyzn(listOfTables,x=c(60,70),status="last")
	axn(listOfTables[[1]],60)+axn(listOfTables[[2]],70)-
	axyzn(listOfTables,x=c(60,70),status="joint")	



