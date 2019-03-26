library(agricolae)


### Name: scheffe.test
### Title: Multiple comparisons, scheffe
### Aliases: scheffe.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus, data=sweetpotato)
comparison <- scheffe.test(model,"virus", group=TRUE,console=TRUE,
main="Yield of sweetpotato\nDealt with different virus")
# Old version scheffe.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
Fc<-anova(model)["virus",4]
out <- with(sweetpotato,scheffe.test(yield, virus, df, MSerror, Fc))
print(out)



