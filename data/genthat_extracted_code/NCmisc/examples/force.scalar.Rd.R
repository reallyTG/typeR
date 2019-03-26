library(NCmisc)


### Name: force.scalar
### Title: Force argument to be a numeric type with length one
### Aliases: force.scalar

### ** Examples

force.scalar(1.5)
force.scalar(NULL,default=.5)
force.scalar(NA,default=.4,min=5,max=10) # default is outside range!
force.scalar(rnorm(1000))
force.scalar(101,max=50)
force.scalar(list(0.4,1,2,3,4,"test"))
force.scalar(data.frame(test=c(1,2,3),name=c("test","me","few")))
force.scalar(Inf)



