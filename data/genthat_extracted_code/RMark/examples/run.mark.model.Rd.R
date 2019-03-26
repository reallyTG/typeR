library(RMark)


### Name: run.mark.model
### Title: Runs analysis with MARK model using MARK.EXE
### Aliases: run.mark.model
### Keywords: model

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
test=function()
{
  data(dipper)
  for(sex in unique(dipper$sex))
  {
	  x=dipper[dipper$sex==sex,]
	  x.proc=process.data(x,model="CJS")
	  x.ddl=make.design.data(x.proc)
	  Phi.dot=list(formula=~1)
	  Phi.time=list(formula=~time)
	  p.dot=list(formula=~1)
	  p.time=list(formula=~time)
	  cml=create.model.list("CJS")
	  x.results=mark.wrapper(cml,data=x.proc,ddl=x.ddl,prefix=sex)
	  assign(paste(sex,"results",sep="."),x.results)
  }
  rm(Male.results,Female.results,x.results)
}
test()
cleanup(ask=FALSE,prefix="Male")
cleanup(ask=FALSE,prefix="Female")
## End(No test)



