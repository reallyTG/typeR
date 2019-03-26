library(stream)


### Name: DSD_ScaleStream
### Title: Scale a Stream from a DSD
### Aliases: DSD_ScaleStream

### ** Examples

stream <- DSD_Gaussians(k=3, d=3)
plot(stream)

# scale stream using 100 points
stream_scaled <- DSD_ScaleStream(stream, n=100)
plot(stream_scaled)



