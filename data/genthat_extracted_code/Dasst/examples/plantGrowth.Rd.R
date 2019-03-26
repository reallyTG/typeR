library(Dasst)


### Name: plantGrowth
### Title: An example of a Dasst object
### Aliases: plantGrowth
### Keywords: dataset datasets

### ** Examples

data(plantGrowth)
plot(plantGrowth[[1]][,"DAP"],plantGrowth[[1]][,"LAID"])

# Or

plot(plantGrowth[[1]][,c("DAP","LAID")])



