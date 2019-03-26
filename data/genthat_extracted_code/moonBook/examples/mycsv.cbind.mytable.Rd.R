library(moonBook)


### Name: mycsv.cbind.mytable
### Title: Export to csv file for class "cbind.mytable"
### Aliases: mycsv.cbind.mytable

### ** Examples

require(moonBook)
res1=mytable(sex+Dx~age+DM,data=acs)
mycsv(res1,file="test1.csv")
mycsv(summary(res1),file="testsummary1.csv")



