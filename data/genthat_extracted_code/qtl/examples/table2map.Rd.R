library(qtl)


### Name: table2map
### Title: Convert a table of marker positions to a map object.
### Aliases: table2map
### Keywords: utilities

### ** Examples

tab <- data.frame(chr=c(1,1,1,1,2,2,2,2,3,3,3,3),
                  pos=c(0,2,4,8,0,2,4,8,0,2,4,8))
rownames(tab) <- paste0("marker", 1:nrow(tab))

map <- table2map(tab)



