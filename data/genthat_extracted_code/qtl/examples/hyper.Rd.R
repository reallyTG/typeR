library(qtl)


### Name: hyper
### Title: Data on hypertension
### Aliases: hyper
### Keywords: datasets

### ** Examples

data(hyper)
summary(hyper)
plot(hyper)

# Note the selective genotyping
## Not run: plotMissing(hyper, reorder=TRUE)

# A marker on c14 has no data; remove it
hyper <- drop.nullmarkers(hyper)



