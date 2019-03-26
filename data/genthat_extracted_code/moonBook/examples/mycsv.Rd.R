library(moonBook)


### Name: mycsv
### Title: Export to csv file for class "mytable" or "cbind.mytable"
### Aliases: mycsv

### ** Examples

require(moonBook)
res=mytable(sex~age+DM,data=acs)
mycsv(res,file="test.csv")
mycsv(summary(res),file="testsummary.csv")



