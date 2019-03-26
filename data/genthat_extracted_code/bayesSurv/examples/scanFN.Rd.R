library(bayesSurv)


### Name: scanFN
### Title: Read Data Values
### Aliases: scanFN
### Keywords: file connection

### ** Examples

cat("x y z", "1 2 3", "1 4 6", "10 20 30", file="ex.data", sep="\n")
pp <- scanFN("ex.data", quiet=FALSE)
pp <- scanFN("ex.data", quiet= TRUE)
print(pp)
unlink("ex.data") # tidy up



