library(x12)


### Name: readSpc
### Title: Function to read X12-spc Files in x12Parameter R objects
### Aliases: readSpc

### ** Examples

## Not run: 
##D   x12SingleObject1 <- readSpc("D:/aaa.spc")
##D   x12SingleObject2 <- readSpc("D:/ak_b.SPC")
##D   x12BatchObject1 <- readSpc(c("D:/ak_b.SPC","D:/aaa.spc"))
##D   setwd("M:/kowarik/Test/x12test")
##D   lf <- list.files()
##D   lf <- lf[unlist(lapply(lf,function(x)substr(x,nchar(x)-2,nchar(x))))##D 
##D   lf <- lf[-c(grep("ind",lf))]
##D   allSPC <- readSpc(lf)
##D   a <- x12(allSPC)  
##D   plot(a@x12List[[1]])
##D   summary(a@x12List[[1]])
## End(Not run)



