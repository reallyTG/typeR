library(mrds)


### Name: ptdata.removal
### Title: Simulated removal observer point count data
### Aliases: ptdata.removal
### Keywords: datasets

### ** Examples

## No test: 
data(ptdata.removal)
xx <- ddf(mrmodel=~glm(formula=~distance),
          dsmodel = ~cds(key="hn", formula = ~1),
          data = ptdata.removal, method = "rem",
          meta.data = list(point=TRUE))
summary(xx)
plot(xx,main="Simulated point count data")
## End(No test)



