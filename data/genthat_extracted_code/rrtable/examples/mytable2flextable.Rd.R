library(rrtable)


### Name: mytable2flextable
### Title: Convert mytable object to flextable
### Aliases: mytable2flextable

### ** Examples

require(moonBook)
require(flextable)
require(officer)
result=mytable(smoking+Dx~.,data=acs)
mytable2flextable(result)
mytable2flextable(result,vanilla=FALSE)
result=mytable(Dx~.,data=acs)
mytable2flextable(result)
mytable2flextable(result,vanilla=FALSE)



