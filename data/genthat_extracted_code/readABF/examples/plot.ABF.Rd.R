library(readABF)


### Name: plot.ABF
### Title: Plots an ABF Object
### Aliases: plot.ABF

### ** Examples

# loads an example file and plots its first sweep
r <- readABF(system.file("extdata", "2009_01_19_0002_varlen_v18.abf", package="readABF"))
plot(r, sweep=1)

# leads to the same result
plot(as.data.frame(r, sweep=1), pch = ".")



