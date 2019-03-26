library(ff)


### Name: ffdfindexget
### Title: Reading and writing ffdf data.frame using ff subscripts
### Aliases: ffdfindexget ffdfindexset
### Keywords: IO data

### ** Examples

message("ff integer subscripts with ffdf return/assign values")
x <- ff(factor(letters))
y <- ff(1:26)
d <- ffdf(x,y)
i <- ff(2:9)
di <- d[i,]
di
d[i,] <- di
message("ff integer subscripts: more control with ffindexget/ffindexset")
di <- ffdfindexget(d, i, FF_RETURN=di)
d <- ffdfindexset(d, i, di)
rm(x, y, d, i, di)
gc()



