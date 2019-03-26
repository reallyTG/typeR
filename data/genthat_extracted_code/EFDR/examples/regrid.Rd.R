library(EFDR)


### Name: regrid
### Title: Regrid ir/regular data
### Aliases: regrid
### Keywords: distance inverse regrid,interpolate, weighting

### ** Examples

df <- data.frame(x = runif(200),y = runif(200),z=rnorm(200))
df.gridded <- regrid(df, n1=10)



