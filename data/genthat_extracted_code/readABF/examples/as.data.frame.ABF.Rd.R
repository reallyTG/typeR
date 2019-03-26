library(readABF)


### Name: as.data.frame.ABF
### Title: Coerces an ABF Object to a Data Frame
### Aliases: as.data.frame.ABF

### ** Examples

# loads an example file and coerces its first sweep to data frame
r <- readABF(system.file("extdata", "2009_01_19_0002_varlen_v18.abf", package="readABF"))
as.data.frame(r, sweep=1)



