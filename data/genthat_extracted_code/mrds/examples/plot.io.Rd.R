library(mrds)


### Name: plot.io
### Title: Plot fit of detection functions and histograms of data from
###   distance sampling independent observer ('io') model
### Aliases: plot.io
### Keywords: plot

### ** Examples

## No test: 
library(mrds)
data(book.tee.data)
egdata <- book.tee.data$book.tee.dataframe
result.io <- ddf(dsmodel=~cds(key = "hn"), mrmodel=~glm(~distance),
                 data=egdata, method="io", meta.data=list(width=4))

# just plot everything
plot(result.io)

# Plot primary and secondary unconditional detection functions on one page
# and  primary and secondary conditional detection functions on another
plot(result.io,which=c(1,2,5,6),pages=2)
## End(No test)



