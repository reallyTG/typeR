library(ff)


### Name: ffindexget
### Title: Reading and writing ff vectors using ff subscripts
### Aliases: ffindexget ffindexset
### Keywords: IO data

### ** Examples

message("ff integer subscripts with ff return/assign values")
x <- ff(factor(letters))
i <- ff(2:9)
xi <- x[i]
xi
xi[] <- NA
xi
x[i] <- xi
x
message("ff integer subscripts: more control with ffindexget/ffindexset")
xi <- ffindexget(x, i, FF_RETURN=xi)
x <- ffindexset(x, i, xi)
rm(x, i, xi)
gc()



