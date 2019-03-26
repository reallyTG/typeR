library(agricolae)


### Name: LSD.test
### Title: Multiple comparisons, "Least significant difference" and Adjust
###   P-values
### Aliases: LSD.test
### Keywords: htest

### ** Examples

library(agricolae)
data(sweetpotato)
model<-aov(yield~virus, data=sweetpotato)
out <- LSD.test(model,"virus", p.adj="bonferroni")
#stargraph
# Variation range: max and min
plot(out)
#endgraph
# Old version LSD.test()
df<-df.residual(model)
MSerror<-deviance(model)/df
out <- with(sweetpotato,LSD.test(yield,virus,df,MSerror))
#stargraph
# Variation interquartil range: Q75 and Q25
plot(out,variation="IQR")
#endgraph
out<-LSD.test(model,"virus",p.adj="hommel",console=TRUE)
plot(out,variation="SD") # variation standard deviation



