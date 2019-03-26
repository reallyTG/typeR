library(astrochron)


### Name: rankSeries
### Title: Create lithofacies rank series from bed thickness data
### Aliases: rankSeries

### ** Examples

# generate example series with random bed thicknesses
exThick=rnorm(n=20,mean=10,sd=2)
# assign alternating rank of 1 and 2
rank=double(20)
rank[seq(from=1,to=19,by=2)] <- 1
rank[seq(from=2,to=20,by=2)] <- 2

# combine into a dataframe
ex=cb(exThick,rank)

# generate lithofacies rank series
rankSeries(ex)



