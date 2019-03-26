library(stream)


### Name: DSD_UniformNoise
### Title: Uniform Noise Data Stream Generator
### Aliases: DSD_UniformNoise

### ** Examples

# create data stream with three clusters in 2D
stream <- DSD_UniformNoise(d=2)
plot(stream, n=100)

# specify a different range for each dimension 
stream <- DSD_UniformNoise(d=3, range=rbind(c(0,1), c(0,10), c(0,5)))
plot(stream, n=100)



