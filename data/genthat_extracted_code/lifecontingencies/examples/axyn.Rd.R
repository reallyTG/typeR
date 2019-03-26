library(lifecontingencies)


### Name: axyn
### Title: Functions to evaluate life insurance and annuities on two heads.
### Aliases: axyn Axyn

### ** Examples

## Not run: 
##D 	data(soa08Act)
##D 	#last survival status annuity
##D 	axyn(tablex=soa08Act, tabley=soa08Act, x=65, y=70, 
##D 		n=5,  status = "last",type = "EV")
##D     #first survival status annuity
##D 	Axyn(tablex=soa08Act, tabley=soa08Act, x=65, y=70,
##D 	status = "last",type = "EV")
##D 	
## End(Not run)



