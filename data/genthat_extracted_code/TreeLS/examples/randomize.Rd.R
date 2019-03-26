library(TreeLS)


### Name: randomize
### Title: Point sampling algorithm: random sample
### Aliases: randomize

### ** Examples

file = system.file("extdata", "pine.laz", package="TreeLS")
tls = readTLS(file)
print(tls)

### thin point cloud - note the point count
tls = tlsSample(tls, randomize(0.33))
print(tls)




