library(moonBook)


### Name: mycsv.mytable
### Title: Export to csv file for class "mytable"
### Aliases: mycsv.mytable

### ** Examples

require(moonBook)
res=mytable(sex~age+DM,data=acs)
mycsv(res,file="test.csv")
mycsv(summary(res),file="testsummary.csv")
mycsv=function(x,row.names=FALSE) UseMethod("mycsv")



