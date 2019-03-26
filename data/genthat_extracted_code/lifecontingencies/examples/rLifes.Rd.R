library(lifecontingencies)


### Name: rLifes
### Title: Function to generate random future lifetimes
### Aliases: rLifes rLife rLifexyz

### ** Examples

## Not run: 
##D ##get 20000 random future lifetimes for the Soa life table at birth
##D data(soa08Act)
##D lifes=rLife(n=20000,object=soa08Act, x=0, type="Tx")
##D check if the expected life at birth derived from the life table is statistically equal 
##D to the expected value of the sample
##D t.test(x=lifes, mu=exn(soa08Act, x=0, type="continuous"))
## End(Not run)
## Not run: 
##D #assessment of curtate expectation of future lifetime of the joint-life status
##D #generate a sample of lifes
##D data(soaLt)
##D soa08Act=with(soaLt, new("actuarialtable",interest=0.06,x=x,lx=Ix,name="SOA2008"))
##D tables=list(males=soa08Act, females=soa08Act)
##D xVec=c(60,65)
##D test=rLifexyz(n=50000, tablesList = tables,x=xVec,type="Kx")
##D #check first survival status
##D t.test(x=apply(test,1,"min"),mu=exyzt(tablesList=tables, x=xVec,status="joint"))
##D #check last survival status
##D t.test(x=apply(test,1,"max"),mu=exyzt(tablesList=tables, x=xVec,status="last"))
## End(Not run)



