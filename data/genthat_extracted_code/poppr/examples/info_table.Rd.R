library(poppr)


### Name: info_table
### Title: Create a table summarizing missing data or ploidy information of
###   a genind or genclone object
### Aliases: info_table
### Keywords: missing ploidy

### ** Examples

data(nancycats)
nancy.miss <- info_table(nancycats, plot = TRUE, type = "missing")
data(Pinf)
Pinf.ploid <- info_table(Pinf, plot = TRUE, type = "ploidy")




