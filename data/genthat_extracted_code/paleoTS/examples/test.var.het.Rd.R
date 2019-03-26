library(paleoTS)


### Name: test.var.het
### Title: Variance heterogeneity test
### Aliases: test.var.het pool.var
### Keywords: models ts

### ** Examples

# look at stickleback data
data(dorsal.spines)
ds<- sub.paleoTS(dorsal.spines, ok=dorsal.spines$nn>=1)	# drop missing data
ds2<- pool.var(ds, minN=5, ret.paleoTS=TRUE)
plot(ds2)



