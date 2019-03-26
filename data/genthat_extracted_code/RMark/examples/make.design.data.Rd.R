library(RMark)


### Name: make.design.data
### Title: Create design dataframes for MARK model specification
### Aliases: make.design.data
### Keywords: utility

### ** Examples



data(example.data)
proc.example.data=process.data(example.data)
ddl=make.design.data(proc.example.data)
ddl=add.design.data(proc.example.data,ddl,parameter="Phi",type="age",
  bins=c(0,.5,1,2,8),name="agebin")
ddl=add.design.data(proc.example.data,ddl,parameter="p",type="time",
  bins=c(1980,1983,1986),name="timebin")






