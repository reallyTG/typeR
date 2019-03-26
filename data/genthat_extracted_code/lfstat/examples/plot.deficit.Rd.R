library(lfstat)


### Name: plot.deficit
### Title: Plot time series of deficits
### Aliases: plot.deficit
### Keywords: low-flow iplot

### ** Examples

data(ray)
r <- find_droughts(ray, threshold = 0.02)
plot(r["1970::1970", ])

plot(r["1970::1970", ], step = FALSE)



