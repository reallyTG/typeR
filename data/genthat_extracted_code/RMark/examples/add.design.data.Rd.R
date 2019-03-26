library(RMark)


### Name: add.design.data
### Title: Add design data
### Aliases: add.design.data
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(example.data)
example.data.proc=process.data(example.data)
ddl=make.design.data(example.data.proc)
ddl=add.design.data(example.data.proc,ddl,parameter="Phi",type="age",
  bins=c(0,.5,10),name="2ages")
ddl=add.design.data(example.data.proc,ddl,parameter="p",type="age",
bins=c(0,.5,10),name="2ages")
ddl=add.design.data(example.data.proc,ddl,parameter="Phi",type="age",
bins=c(0,1,10),name="2ages",replace=TRUE)
## End(No test)



