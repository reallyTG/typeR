library(oak)


### Name: as.rtree
### Title: Conversion to an 'rtree' object
### Aliases: as.rtree as.rtree.rtree as.rtree.character as.rtree.data.frame

### ** Examples

## Rooted tree
df = data.frame(x = c("A", "A", "A", "A"), 
                y = c("B", "C", "C", "C"), 
                z = c("D", "E", "E", "F"), 
                stringsAsFactors = FALSE)
                
(as.rtree(df))

## Unrooted tree
df = data.frame(x = c("A", "A", "A", "X"), 
                y = c("B", "C", "C", "Y"), 
                z = c("D", "E", "E", "Z"), 
                stringsAsFactors = FALSE)
                
(as.rtree(df))




