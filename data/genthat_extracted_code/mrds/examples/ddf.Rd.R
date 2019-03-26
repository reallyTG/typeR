library(mrds)


### Name: ddf
### Title: Distance Detection Function Fitting
### Aliases: ddf
### Keywords: Models ~Statistical

### ** Examples

# load data
data(book.tee.data)
region <- book.tee.data$book.tee.region
egdata <- book.tee.data$book.tee.dataframe
samples <- book.tee.data$book.tee.samples
obs <- book.tee.data$book.tee.obs

# fit a half-normal detection function
result <- ddf(dsmodel=~mcds(key="hn", formula=~1), data=egdata, method="ds",
              meta.data=list(width=4))

# fit an independent observer model with full independence
result.io.fi <- ddf(mrmodel=~glm(~distance), data=egdata, method="io.fi",
                    meta.data=list(width = 4))

# fit an independent observer model with point independence
result.io <- ddf(dsmodel=~cds(key = "hn"), mrmodel=~glm(~distance),
                 data=egdata, method="io", meta.data=list(width=4))
## Not run: 
##D 
##D # simulated single observer point count data (see ?ptdata.single)
##D data(ptdata.single)
##D ptdata.single$distbegin <- (as.numeric(cut(ptdata.single$distance,10*(0:10)))-1)*10
##D ptdata.single$distend <- (as.numeric(cut(ptdata.single$distance,10*(0:10))))*10
##D model <- ddf(data=ptdata.single, dsmodel=~cds(key="hn"),
##D              meta.data=list(point=TRUE,binned=TRUE,breaks=10*(0:10)))
##D 
##D summary(model)
##D 
##D plot(model,main="Single observer binned point data - half normal")
##D 
##D model <- ddf(data=ptdata.single, dsmodel=~cds(key="hr"),
##D              meta.data=list(point=TRUE, binned=TRUE, breaks=10*(0:10)))
##D 
##D summary(model)
##D 
##D plot(model,main="Single observer binned point data - hazard rate")
##D 
##D dev.new()
##D 
##D # simulated double observer point count data (see ?ptdata.dual)
##D # setup data
##D data(ptdata.dual)
##D ptdata.dual$distbegin <- (as.numeric(cut(ptdata.dual$distance,10*(0:10)))-1)*10
##D ptdata.dual$distend <- (as.numeric(cut(ptdata.dual$distance,10*(0:10))))*10
##D 
##D model <- ddf(method="io", data=ptdata.dual, dsmodel=~cds(key="hn"),
##D              mrmodel=~glm(formula=~distance*observer),
##D              meta.data=list(point=TRUE, binned=TRUE, breaks=10*(0:10)))
##D 
##D summary(model)
##D 
##D plot(model, main="Dual observer binned point data", new=FALSE, pages=1)
##D 
##D model <- ddf(method="io", data=ptdata.dual,
##D              dsmodel=~cds(key="unif", adj.series="cos", adj.order=1),
##D              mrmodel=~glm(formula=~distance*observer),
##D              meta.data=list(point=TRUE, binned=TRUE, breaks=10*(0:10)))
##D 
##D summary(model)
##D 
##D par(mfrow=c(2,3))
##D plot(model,main="Dual observer binned point data",new=FALSE)
##D 
## End(Not run)



