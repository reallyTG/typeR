library(mrds)


### Name: plot.ds
### Title: Plot fit of detection functions and histograms of data from
###   distance sampling model
### Aliases: plot.ds
### Keywords: plot

### ** Examples

## No test: 
# fit a model to the tee data
data(book.tee.data)
egdata <- book.tee.data$book.tee.dataframe
xx <- ddf(dsmodel=~mcds(key="hn", formula=~sex),
          data=egdata[egdata$observer==1, ],
          method="ds", meta.data=list(width=4))

# not showing predicted probabilities
plot(xx, breaks=c(0, 0.5, 1, 2, 3, 4), showpoints=FALSE)

# two subsets
plot(xx, breaks=c(0, 0.5, 1, 2, 3, 4), subset=sex==0)
plot(xx, breaks=c(0, 0.5, 1, 2, 3, 4), subset=sex==1)

# put both plots on one page
plot(xx, breaks=c(0, 0.5, 1, 2, 3, 4), pages=1, which=1:2)
## End(No test)



