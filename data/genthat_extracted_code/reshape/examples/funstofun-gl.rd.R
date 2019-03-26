library(reshape)


### Name: funstofun
### Title: Aggregate multiple functions into a single function
### Aliases: funstofun
### Keywords: manip

### ** Examples
funstofun(min, max)(1:10)
funstofun(length, mean, var)(rnorm(100))


