library(stream)


### Name: DSO_Sample
### Title: Sampling from a Data Stream (Data Stream Operator)
### Aliases: DSO_Sample

### ** Examples

stream <- DSD_Gaussians(k=3, noise=0.05)

sample <- DSO_Sample(k=20)

update(sample, stream, 500)
sample

# plot points in sample
plot(get_points(sample))



