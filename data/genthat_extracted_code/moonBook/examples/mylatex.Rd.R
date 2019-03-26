library(moonBook)


### Name: mylatex
### Title: Exporting "cbind.mytable","mytable" to LaTeX format
### Aliases: mylatex mylatex.default mylatex.mytable mylatex.cbind.mytable

### ** Examples

require(moonBook)
out=mytable(sex~.,data=acs)
mylatex(out)
out1=mytable(sex+Dx~.,data=acs)
mylatex(out1,size=6)



