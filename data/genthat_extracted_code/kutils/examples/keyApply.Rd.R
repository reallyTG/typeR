library(kutils)


### Name: keyApply
### Title: Apply variable key to data frame (generate recoded data frame)
### Aliases: keyApply

### ** Examples

mydf.key.path <- system.file("extdata", "mydf.key.csv", package = "kutils")
mydf.key <-  keyImport(mydf.key.path)
mydf.path <- system.file("extdata", "mydf.csv", package = "kutils")

mydf <- read.csv(mydf.path, stringsAsFactors = FALSE)
mydf2 <- keyApply(mydf, mydf.key)

nls.keylong.path <- system.file("extdata", "natlongsurv.key_long.csv", package = "kutils")
nls.keylong <- keyImport(nls.keylong.path, long = TRUE)
data(natlongsurv)
nls.dat <- keyApply(natlongsurv, nls.keylong)




