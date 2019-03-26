library(mrds)


### Name: ptdata.dual
### Title: Simulated dual observer point count data
### Aliases: ptdata.dual
### Keywords: datasets

### ** Examples

## No test: 
data(ptdata.dual)
xx <- ddf(mrmodel=~glm(formula=~distance),
          dsmodel = ~cds(key="hn", formula = ~1),
          data = ptdata.dual, method = "io", meta.data = list(point=TRUE))
summary(xx)
plot(xx,main="Simulated point count data")
## End(No test)



