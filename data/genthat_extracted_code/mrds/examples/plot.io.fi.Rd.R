library(mrds)


### Name: plot.io.fi
### Title: Plot fit of detection functions and histograms of data from
###   distance sampling independent observer model with full independence
###   ('io.fi')
### Aliases: plot.io.fi
### Keywords: plot

### ** Examples

## No test: 
library(mrds)
data(book.tee.data)
egdata <- book.tee.data$book.tee.dataframe
result.io.fi <- ddf(mrmodel=~glm(~distance), data = egdata, method = "io.fi",
              meta.data = list(width = 4))

# just plot everything
plot(result.io.fi)

# Plot primary and secondary unconditional detection functions on one page
# and  primary and secondary conditional detection functions on another
plot(result.io.fi,which=c(1,2,5,6),pages=2)
## End(No test)



