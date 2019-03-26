library(moonBook)


### Name: mytable
### Title: Produce table for descriptive statistics
### Aliases: mytable mytable.formula mytable.data.frame

### ** Examples

mytable(acs)
mytable(~age+sex,data=acs)
mytable(Dx~age+sex+height+weight+TC+TG+HDLC,data=acs,method=3,digits=2)
mytable(am+cyl~.,data=mtcars)
out=mytable(sex~.,data=acs)
out
summary(out)
require(ztable)
ztable(out)
mytable(acs)



