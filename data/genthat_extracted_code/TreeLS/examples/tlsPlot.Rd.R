library(TreeLS)


### Name: tlsPlot
### Title: Plot TLS outputs
### Aliases: tlsPlot

### ** Examples

### single tree
file = system.file("extdata", "spruce.laz", package="TreeLS")
tls = readTLS(file)
tls = stemPoints(tls)
df = stemSegmentation(tls)

tlsPlot(tls, df)

### For further examples check:
?stemSegmentation



