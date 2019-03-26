library(RMark)


### Name: process.data
### Title: Process encounter history dataframe for MARK analysis
### Aliases: process.data
### Keywords: utility

### ** Examples


data(example.data)
proc.example.data=process.data(data=example.data,begin.time=1980,
groups=c("sex","age","region"),
age.var=2,initial.age=c(0,1,2))

data(dipper)
dipper.process=process.data(dipper)




