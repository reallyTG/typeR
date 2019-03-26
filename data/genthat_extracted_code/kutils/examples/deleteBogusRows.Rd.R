library(kutils)


### Name: deleteBogusRows
### Title: Remove rows in which the proportion of missing data exceeds a
###   threshold.
### Aliases: deleteBogusRows

### ** Examples

mymat <- matrix(rnorm(10*100), nrow = 10, ncol = 100,
               dimnames = list(1:10, paste0("x", 1:100)))
mymat <- rbind(mymat, c(32, rep(NA, 99)))
mymat2 <- deleteBogusRows(mymat)
mydf <- as.data.frame(mymat)
mydf$someFactor <- factor(sample(c("A", "B"), size = NROW(mydf), replace = TRUE))
mydf2 <- deleteBogusRows(mydf, n = "all")



