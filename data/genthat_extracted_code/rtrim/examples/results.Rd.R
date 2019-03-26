library(rtrim)


### Name: results
### Title: collect observed, modelled, and imputed counts from TRIM output
### Aliases: results

### ** Examples

data(skylark)
z <- trim(count ~ site + time, data=skylark, model=2);
out <- results(z)



