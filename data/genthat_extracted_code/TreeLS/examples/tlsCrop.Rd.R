library(TreeLS)


### Name: tlsCrop
### Title: Point cloud cropping
### Aliases: tlsCrop

### ** Examples

file = system.file("extdata", "model_boles.laz", package="TreeLS")
tls = readTLS(file)
plot(tls)

tls = tlsCrop(tls, 2, 3, 1.5, TRUE, TRUE)
plot(tls)

tls = tlsCrop(tls, 15, 10, 3, FALSE, FALSE)
plot(tls)



