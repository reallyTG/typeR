library(extracat)


### Name: arsim
### Title: block-structured arrays
### Aliases: arsim

### ** Examples

A <- arsim(1000, c(12,12), 3, shuffle = FALSE)
fluctile(A)

A <- arsim(1000, c(12,12), 3, shuffle = FALSE, dimnames = list(NULL,letters))
dimnames(A)

A <- arsim(4000, c(11,7,5), 3, shuffle = TRUE, dimnames = list(0:2,letters))
dimnames(A)

## Not run: 
##D A2<- arsim(1000, c(12,12,12), 3, shuffle = FALSE)
##D fluctile3d(A2, shape ="oct")
## End(Not run)




