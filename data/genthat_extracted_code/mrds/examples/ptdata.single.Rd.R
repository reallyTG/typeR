library(mrds)


### Name: ptdata.single
### Title: Simulated single observer point count data
### Aliases: ptdata.single
### Keywords: datasets

### ** Examples

## No test: 
data(ptdata.single)
xx=ddf(dsmodel = ~cds(key="hn", formula = ~1), data = ptdata.single,
         method = "ds", meta.data = list(point=TRUE))
summary(xx)
plot(xx,main="Simulated point count data")
## End(No test)



