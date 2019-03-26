library(fractalrock)


### Name: fractal
### Title: Create time series based on fractal generators
### Aliases: fractal fractal.uniform fractal.random next.seeds
### Keywords: ts math

### ** Examples

data(generators)
series <- fractal(sampleInitiators, sampleGenerators, count=10)

# View the results of a single iteration using the second pattern
series <- fractal(sampleInitiators, sampleGenerators, epochs=1, only=2)



