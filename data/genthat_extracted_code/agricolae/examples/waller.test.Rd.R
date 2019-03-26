library(agricolae)


### Name: waller.test
### Title: Multiple comparisons, Waller-Duncan
### Aliases: waller.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus, data=sweetpotato)
out <- waller.test(model,"virus", group=TRUE)
#startgraph
par(mfrow=c(2,2))
# variation: SE is error standard
# variation: range is Max - Min
bar.err(out$means,variation="SD",horiz=TRUE,xlim=c(0,45),bar=FALSE,
col=colors()[25],space=2, main="Standard deviation",las=1)
bar.err(out$means,variation="SE",horiz=FALSE,ylim=c(0,45),bar=FALSE,
col=colors()[15],space=2,main="SE",las=1)
bar.err(out$means,variation="range",ylim=c(0,45),bar=FALSE,col="green",
space=3,main="Range = Max - Min",las=1)
bar.group(out$groups,horiz=FALSE,ylim=c(0,45),density=8,col="red", 
main="Groups",las=1)
#endgraph
# Old version HSD.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
Fc<-anova(model)["virus",4]
out <- with(sweetpotato,waller.test(yield, virus, df, MSerror, Fc, group=TRUE))
print(out)



