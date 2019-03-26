library(mrds)


### Name: ddf.ds
### Title: CDS/MCDS Distance Detection Function Fitting
### Aliases: ddf.ds
### Keywords: Models Statistical

### ** Examples


# ddf.ds is called when ddf is called with method="ds"
## No test: 
data(book.tee.data)
region <- book.tee.data$book.tee.region
egdata <- book.tee.data$book.tee.dataframe
samples <- book.tee.data$book.tee.samples
obs <- book.tee.data$book.tee.obs
result <- ddf(dsmodel = ~mcds(key = "hn", formula = ~1),
              data = egdata[egdata$observer==1, ], method = "ds",
              meta.data = list(width = 4))
summary(result,se=TRUE)
plot(result,main="cds - observer 1")
print(dht(result,region,samples,obs,options=list(varflag=0,group=TRUE),
          se=TRUE))
print(ddf.gof(result))
## End(No test)



