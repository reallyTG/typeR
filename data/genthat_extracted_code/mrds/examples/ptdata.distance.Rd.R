library(mrds)


### Name: ptdata.distance
### Title: Single observer point count data example from Distance
### Aliases: ptdata.distance
### Keywords: datasets

### ** Examples

## No test: 
data(ptdata.distance)
xx <- ddf(dsmodel = ~cds(key="hn", formula = ~1), data = ptdata.distance,
          method = "ds", meta.data = list(point=TRUE))
summary(xx)
plot(xx,main="Distance point count data")
ddf.gof(xx)
Regions <- data.frame(Region.Label=1,Area=1)
Samples <- data.frame(Sample.Label=1:30,
                      Region.Label=rep(1,30),
                      Effort=rep(1,30))
print(dht(xx,sample.table=Samples,region.table=Regions))
## End(No test)



