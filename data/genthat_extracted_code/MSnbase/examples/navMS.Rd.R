library(MSnbase)


### Name: navMS
### Title: Navigate an 'MSnExp' object
### Aliases: navMS nextMS prevMS

### ** Examples

f <- msdata::proteomics(full.names = TRUE, pattern = "MS3")
x <- readMSData(f, centroided. = c(FALSE, TRUE, FALSE), mode = "onDisk")
(sp <- which(msLevel(x) == 3)[2]) ## 2nd MS3 spectrum
x[[sp]] ## curent MS3
MSnbase:::nextMS(sp, x) ## next MS3
MSnbase:::prevMS(sp, x) ## prev MS3
MSnbase:::prevMS(sp, x, 2L) ## prev MS2
MSnbase:::prevMS(sp, x, 1L) ## prev MS1



