library(RcmdrMisc)


### Name: mergeRows
### Title: Function to Merge Rows of Two Data Frames.
### Aliases: mergeRows mergeRows.data.frame
### Keywords: manip

### ** Examples

if (require(car)){
    data(Duncan)
    D1 <- Duncan[1:20,]
    D2 <- Duncan[21:45,]
    D <- mergeRows(D1, D2)
    print(D)
    dim(D)
}



