library(usl)


### Name: scalability,USL-method
### Title: Scalability function of a USL model
### Aliases: scalability,USL-method scalability

### ** Examples

require(usl)

data(raytracer)

## Compute the scalability function
s <- scalability(usl(throughput ~ processors, raytracer))

## Print scalability for 32 CPUs for the demo dataset
print(s(32))

## Plot scalability for the range from 1 to 64 CPUs
plot(s, from=1, to=64)




