library(qs)


### Name: qdump
### Title: qdump
### Aliases: qdump

### ** Examples

x <- data.frame(int = sample(1e3, replace=TRUE), 
                 num = rnorm(1e3), 
                 char = randomStrings(1e3), stringsAsFactors = FALSE)
myfile <- tempfile()
qsave(x, myfile)
x2 <- qdump(myfile)



