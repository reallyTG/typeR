library(agricolae)


### Name: SNK.test
### Title: Student-Newman-Keuls (SNK)
### Aliases: SNK.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
out <- SNK.test(model,"virus", console=TRUE, 
main="Yield of sweetpotato. Dealt with different virus")
print(SNK.test(model,"virus", group=FALSE))
# version old SNK.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
out <- with(sweetpotato,SNK.test(yield,virus,df,MSerror, group=TRUE))
print(out$groups)



