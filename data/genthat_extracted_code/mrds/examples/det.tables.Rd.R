library(mrds)


### Name: det.tables
### Title: Observation detection tables
### Aliases: det.tables

### ** Examples

## No test: 
data(book.tee.data)
region<<-book.tee.data$book.tee.region
egdata<<-book.tee.data$book.tee.dataframe
samples<<-book.tee.data$book.tee.samples
obs<<-book.tee.data$book.tee.obs
xx=ddf(mrmodel=~glm(formula=~distance*observer),
 dsmodel = ~mcds(key = "hn", formula = ~sex), data = egdata, method = "io",
meta.data = list(width = 4))
tabs=det.tables(xx,breaks=c(0,.5,1,2,3,4))
par(mfrow=c(2,2))
plot(tabs,new=FALSE,which=c(1,2,5,6))
## End(No test)



