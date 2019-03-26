library(JWileymisc)


### Name: winsorizor
### Title: Winsorize at specified percentiles
### Aliases: winsorizor

### ** Examples

dev.new(width = 10, height = 5)
par(mfrow = c(1, 2))
hist(as.vector(eurodist), main = "Eurodist")
hist(winsorizor(as.vector(eurodist), .05), main = "Eurodist with lower and upper\n5% winsorized")

dat <- data.table(x = 1:5)
dat[, y := scale(1:5)]
winsorizor(dat$y, .01)

## make a copy of the data table
winsorizor(dat, .01)

winsorizor(mtcars, .01)

winsorizor(matrix(1:9, 3), .01)

rm(dat) # clean up



