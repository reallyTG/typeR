library(qdap)


### Name: qcombine
### Title: Combine Columns
### Aliases: qcombine
### Keywords: combine, transform

### ** Examples

## Not run: 
##D A <- list(
##D     a = c(1, 2, 3),
##D     b = qcv(mpg, hp),
##D     c = c("disp", "am")
##D )
##D B <- list(
##D     c(1, 2, 3),
##D     d = qcv(mpg, hp),
##D     c("disp", "am")
##D )
##D 
##D qcombine(head(mtcars), A)
##D qcombine(head(mtcars), B)
##D qcombine(head(mtcars), B, elim.old = FALSE)
## End(Not run)



