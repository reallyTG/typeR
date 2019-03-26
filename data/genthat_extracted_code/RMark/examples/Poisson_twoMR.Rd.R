library(RMark)


### Name: Poisson_twoMR
### Title: Example of Poisson Mark-Resight model
### Aliases: Poisson_twoMR
### Keywords: datasets

### ** Examples

 ## No test: 
# This example is excluded from testing to reduce package check time
data(Poisson_twoMR)
pois.proc=process.data(Poisson_twoMR,model="PoissonMR",groups="pg",
		counts=list("Unmarked Seen"=matrix(c(1237,588),nrow=2,ncol=1),
				    "Marked Unidentified"=matrix(c(10,5),nrow=2,ncol=1),
					"Known Marks"=matrix(c(60,0),nrow=2,ncol=1)))
pois.ddl=make.design.data(pois.proc)
mod=mark(pois.proc,pois.ddl,
		model.parameters=list(alpha=list(formula=~1),
				              U=list(formula=~-1+group),
				              sigma=list(formula=~1,fixed=0)),
	 	                      initial=c(0.9741405 ,0.0000000 ,6., 5.),threads=2)
summary(mod)	 	                 
## End(No test)



