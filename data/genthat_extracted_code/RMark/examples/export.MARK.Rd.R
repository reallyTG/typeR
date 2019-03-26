library(RMark)


### Name: export.MARK
### Title: Export data and models for import in MARK
### Aliases: export.MARK
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(mallard)
Dot=mark(mallard,nocc=90,model="Nest",
	model.parameters=list(S=list(formula=~1)))
mallard.proc=process.data(mallard,nocc=90,model="Nest")
export.MARK(mallard.proc,"mallard",Dot,replace=TRUE)
data(robust)
time.intervals=c(0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0)
S.time=list(formula=~time)
p.time.session=list(formula=~-1+session:time,share=TRUE)
GammaDoublePrime.random=list(formula=~time,share=TRUE)
model.1=mark(data = robust, model = "Robust",
	time.intervals=time.intervals,
	model.parameters=list(S=S.time,
			GammaDoublePrime=GammaDoublePrime.random,p=p.time.session))
robust.proc=process.data(data = robust, model = "Robust",
	time.intervals=time.intervals)
export.MARK(robust.proc,"robust",	model.1,replace=TRUE)
## End(No test)



