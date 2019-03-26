library(moonBook)


### Name: myhtml
### Title: Export to html file for class "mytable" or "cbind.mytable" of
###   "data.frame"
### Aliases: myhtml myhtml.default myhtml.mytable myhtml.cbind.mytable

### ** Examples

require(moonBook)
res=mytable(sex~age+Dx,data=acs)
myhtml(res)
res1=mytable(sex+Dx~.,data=acs)
myhtml(res1)
x=head(iris)
myhtml(x)
myhtml(x,caption="Table 1. myhtml Test")
myhtml(x,caption="Table 1. myhtml Test",rownames=FALSE)



