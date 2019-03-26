library(agricolae)


### Name: duncan.test
### Title: Duncan's new multiple range test
### Aliases: duncan.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus,data=sweetpotato)
out <- duncan.test(model,"virus", 
main="Yield of sweetpotato. Dealt with different virus")
plot(out,variation="IQR")
duncan.test(model,"virus",alpha=0.01,console=TRUE)
# version old duncan.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
out <- with(sweetpotato,duncan.test(yield,virus,df,MSerror, group=TRUE))
plot(out,horiz=TRUE,las=1)
print(out$groups)



