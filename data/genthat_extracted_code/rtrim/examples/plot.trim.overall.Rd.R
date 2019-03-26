library(rtrim)


### Name: plot.trim.overall
### Title: Plot overall slope
### Aliases: plot.trim.overall

### ** Examples

data(skylark)
m <- trim(count ~ site + time, data=skylark, model=2)
plot(overall(m))




