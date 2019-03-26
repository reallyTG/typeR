library(Rwinsteps)


### Name: ifile
### Title: Item and Person Summary Files
### Aliases: ifile as.ifile read.ifile pfile as.pfile read.pfile
### Keywords: methods

### ** Examples

imeasure <- rnorm(5)
ifile(imeasure, name = paste("item", 1:5, sep = ""))
as.ifile(data.frame(measure = imeasure, entry = 1:5))

pmeasure <- rnorm(3)
pfile(pmeasure, name = c("Skeeter", "Shira", "Soto"))
as.pfile(data.frame(measure = pmeasure, entry = 1:3))



