library(agricolae)


### Name: REGW.test
### Title: Ryan, Einot and Gabriel and Welsch multiple range test
### Aliases: REGW.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
out<- REGW.test(model,"virus", 
main="Yield of sweetpotato. Dealt with different virus")
print(out)
REGW.test(model,"virus",alpha=0.05,console=TRUE,group=FALSE)



