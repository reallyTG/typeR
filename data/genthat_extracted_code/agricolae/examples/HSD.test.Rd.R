library(agricolae)


### Name: HSD.test
### Title: Multiple comparisons: Tukey
### Aliases: HSD.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus, data=sweetpotato)
out <- HSD.test(model,"virus", group=TRUE,console=TRUE,
main="Yield of sweetpotato\nDealt with different virus")
#stargraph
# Variation range: max and min
plot(out)
#endgraph
out<-HSD.test(model,"virus", group=FALSE)
print(out$comparison)
# Old version HSD.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
with(sweetpotato,HSD.test(yield,virus,df,MSerror, group=TRUE,console=TRUE,
main="Yield of sweetpotato. Dealt with different virus"))



